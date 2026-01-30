# Files that require bigbang integration testing

### See [bb MR testing](./test-package-against-bb.md) for details regarding testing changes against bigbang umbrella chart

There are certain integrations within the bigbang ecosystem and this package that require additional testing outside of the specific package tests ran during CI.  This is a requirement when files within those integrations are changed, as to avoid causing breaks up through the bigbang umbrella.  Currently, these include changes to the istio implementation within harbor (see: [istio templates](../chart/templates/bigbang/istio/). Additional networking configurations use bb-common, which can be found in[values.yaml](../chart/values.yaml). See [networkPolicies](../chart/values.yaml#L79), [routes](../chart/values.yaml#L42)).

Be aware that any changes to files listed in the [**Modifications made to upstream chart**] section below which will also require a codeowner to validate the changes using above method, to ensure that they do not affect the package or its integrations adversely.

Be sure to also test against monitoring locally as it is integrated by default with these high-impact service control packages, and needs to be validated using the necessary chart values beneath `istio.hardened` block with `monitoring.enabled` set to true as part of your dev-overrides.yaml

# To upgrade the Harbor Package

Check the [upstream changelog](https://github.com/goharbor/harbor/releases) and the [upgrade notes](https://goharbor.io/docs/2.9.0/administration/upgrade/).

# Upgrading

Find the latest version of the `harbor` image that matches the latest version in IronBank that Renovate has identified from here: <https://github.com/goharbor/harbor-helm>

The below details the steps required to update to a new version of the Harbor package.

1. Renovate may have already made changes in the development branch. If that is the case then just verify that the changes are correct as you go through these steps.
1. Discover the chart version tag that matches with the application version from the [upstream chart](https://github.com/goharbor/harbor-helm) by looking at the Chart.yaml. Do diff between old and new release tags to become aware of any significant chart changes. A graphical diff tool such as [Meld](https://meldmerge.org/) is useful. You can see where the current chart version and available versions are at under the `sources` section in Chart.yaml.`
1. Read the /CHANGELOG.md from the release tag from upstream [upstream chart](https://github.com/goharbor/harbor-helm). Also, be aware of changes in the Gitlab chart that could affect the Harbor chart. Take note of any special upgrade instructions, if any.
1. If Renovate has not created a development branch and merge request then manually create them.
1. Merge/Sync the new helm chart with the existing Harbor package code. A graphical diff tool like [Meld](https://meldmerge.org/) is useful. Reference the "Modifications made to upstream chart" section below. Be careful not to overwrite Big Bang Package changes that need to be kept. Note that some files will have combinations of changes that you will overwrite and changes that you keep. Stay alert. The hardest file to update is the ```/chart/values.yaml``` because many defaults are changed.
1. In `chart/Chart.yaml` update harbor, postgresql, redis and gluon to the latest version and run `helm dependency update chart` from the top level of the repo to package it up.
1. In ```/chart/values.yaml``` update all the harbor components (nginx, portal, core, jobservice, registry, controller, trivy, database, redis and exporter), redis-bb and postgresql image tags to the new version.
1. Update `chart/Chart.yaml` to the appropriate versions. The annotation version should match the ```appVersion```.

```

### Update dependencies in chart.yml

```
helm dependency update ./chart
```

## Update main chart

```chart/Chart.yaml```

- update harbor `version` and `appVersion`
- Ensure Big Bang version suffix is appended to chart version
- Ensure dependencies harbor, gluon, postgresql, and redis are present and up to date

```yaml
version: $VERSION-bb.0
dependencies:
  - name: harbor
    version: $HARBOR_VERSION
    repository: https://helm.goharbor.io
    alias: upstream
  - name: postgresql
    version: $POSTGRESQL_VERSION
    repository: oci://registry-1.docker.io/bitnamicharts
    condition: postgresql.enabled
  - name: redis
    version: $REDIS_VERSION
    repository: oci://registry1.dso.mil/bigbang
    condition: redis-bb.enabled
    alias: redis-bb
  - name: gluon
    version: $GLUON_VERSION
    repository: oci://registry1.dso.mil/bigbang
annotations:
  bigbang.dev/applicationVersions: |
    - Harbor Core: $HARBOR_APP_VERSION
```

```chart/values.yaml```

- In ```/chart/values.yaml``` verify all the harbor components (nginx, portal, core, jobservice, registry, controller, trivy, database, redis and exporter), redis-bb and postgresql image tags to the new version.
- For example, if harbor-core is updated to version v2.9.0, you should update:

```
core:
  image:
    repository: registry1.dso.mil/ironbank/opensource/goharbor/harbor-core
    # -- Overrides the image tag whose default is the chart's appVersion
    tag: v2.9.0
```

```tests\images.txt```

- verify that image tag in is updated to match current version

```
registry1.dso.mil/ironbank/opensource/goharbor/harbor-exporter:v2.9.0
```

# Testing new harbor Version

### Deploy harbor as part of BigBang in the local dev cluster

harbor-values-overrides.yaml

```
istiod:
  enabled: true
istioCRDs:
  enabled: true
monitoring:
  enabled: true

addons:
  harbor:
    enabled: true
    git:
      tag: null
      branch: "renovate/ironbank"
    values:
      upstream:
        metrics:
          enabled: true
          serviceMonitor:
            enabled: true
      istio:
        enabled: true
        authorizationPolicies:
          enabled: true
          generateFromNetpol: true
      monitoring:
        enabled: true
      networkPolicies:
        enabled: true
        ingress:
          to:
            harbor:8001:
              from:
                k8s:
                  monitoring-monitoring-kube-prometheus@monitoring/prometheus: true
        egress:
          from:
            harbor:
              to:
                k8s:
                  tempo/tempo:9411: true
```

Visit `https://harbor.dev.bigbang.mil` and login

default credentials

```
  username: admin

  password: Harbor12345
```

From the CLI, run the following to test pushing/pulling from registry is working as expected

```
docker login harbor.dev.bigbang.mil

# Enter default credentials

docker pull alpine:latest --platform linux/amd64

docker tag alpine:latest harbor.dev.bigbang.mil/library/alpine:latest --platform linux/amd64

docker push --platform linux/amd64 harbor.dev.bigbang.mil/library/alpine:latest

```

Navigate to the Prometheus target page (<https://prometheus.dev.bigbang.mil/targets>) and validate that the Harbor targets show as up.

# Chart Additions

### automountServiceAccountToken

The mutating Kyverno policy named `update-automountserviceaccounttokens` is leveraged to harden all ServiceAccounts in this package with `automountServiceAccountToken: false`. This policy is configured by namespace in the Big Bang umbrella chart repository at [chart/templates/kyverno-policies/values.yaml](https://repo1.dso.mil/big-bang/bigbang/-/blob/master/chart/templates/kyverno-policies/values.yaml?ref_type=heads).

This policy revokes access to the K8s API for Pods utilizing said ServiceAccounts. If a Pod truly requires access to the K8s API (for app functionality), the Pod is added to the `pods:` array of the same mutating policy. This grants the Pod access to the API, and creates a Kyverno PolicyException to prevent an alert.

# Modifications made to upstream chart

This is a high-level list of modifications that Big Bang has made to the upstream helm chart. You can use this as as cross-check to make sure that no modifications were lost during the upgrade process.

## chart/templates/nginx/deployment.yaml

- Updated user and group to nginx uid as 10000 does not exist and causes issues when compiling nginx conf at startup

```diff
@@ -40,8 +40,8 @@ spec:
      serviceAccountName: {{ .Values.nginx.serviceAccountName }}
{{- end }}
      securityContext:
-       runAsUser: 10000
-       fsGroup: 10000
+       runAsUser: 997
+       fsGroup: 994
      {{- with .Values.imagePullSecrets }}
      imagePullSecrets:
        {{- toYaml . | nindent 8 }}
```

## chart/templates/nginx/deployment.yaml

- Updated user and group to nginx uid as 10000 does not exist and causes issues when compiling nginx conf at startup

```diff
@@ -34,8 +34,8 @@ spec:
{{- end }}
    spec:
      securityContext:
-       runAsUser: 10000
-       fsGroup: 10000
+       runAsUser: 997
+       fsGroup: 994
        runAsNonRoot: true
      {{- with .Values.imagePullSecrets }}
      imagePullSecrets:
```

## chart/templates/exporter/exporter-dpl.yaml

- Added lines 59-61 to enable setting of container securityContext for exporter.  This was absent from the upstream chart, but appears as though it will be added in chart version 1.15.x.

```yaml
{{- with .Values.exporter.containerSecurityContext }}
    {{- toYaml . | nindent 10 }}
{{- end }}
```

## chart/templates/registry/registry-svc.yaml

- remove `https` prefix from registry to allow for mTLS STRICT mode to function correctly.

```diff
@@ -6,7 +6,7 @@ metadata:
{{ include "harbor.labels" . | indent 4 }}
spec:
  ports:
-   - name: {{ ternary "https-registry" "http-registry" .Values.internalTLS.enabled }}
+   - name: registry
      port: {{ template "harbor.registry.servicePort" . }}

    - name: {{ ternary "https-controller" "http-controller" .Values.internalTLS.enabled }}
```
