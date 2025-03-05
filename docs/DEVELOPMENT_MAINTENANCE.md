# Files that require bigbang integration testing

### See [bb MR testing](./docs/test-package-against-bb.md) for details regarding testing changes against bigbang umbrella chart

There are certain integrations within the bigbang ecosystem and this package that require additional testing outside of the specific package tests ran during CI.  This is a requirement when files within those integrations are changed, as to avoid causing breaks up through the bigbang umbrella.  Currently, these include changes to the istio implementation within harbor (see: [istio templates](./chart/templates/bigbang/istio/), [network policy templates](./chart/templates/bigbang/networkpolicies/), [service entry templates](./chart/templates/bigbang/serviceentries/)).

Be aware that any changes to files listed in the [Modifications made to upstream chart](#modifications-made-to-upstream-chart) section will also require a codeowner to validate the changes using above method, to ensure that they do not affect the package or its integrations adversely.

Be sure to also test against monitoring locally as it is integrated by default with these high-impact service control packages, and needs to be validated using the necessary chart values beneath `istio.hardened` block with `monitoring.enabled` set to true as part of your dev-overrides.yaml

# To upgrade the Harbor Package

Check the [upstream changelog](https://github.com/goharbor/harbor/releases) and the [upgrade notes](https://goharbor.io/docs/2.9.0/administration/upgrade/).

# Upgrading

Find the latest version of the `harbor` image that matches the latest version in IronBank that Renovate has identified from here: <https://github.com/goharbor/harbor-helm>

Run a KPT update against the main chart folder:

```shell
# To find the chart version for the command below:
# - Browse to the [upstream](https://github.com/goharbor/harbor-helm).
# - Click on the drop-down menu on the upper left, then on Tags.
# - Scroll through the tags until you get to the Helm chart version tags (e.g. v1.13.0, v1.12.4, etc.).
# - Starting with the most recent Helm chart version tag, open the Chart.yaml for the tag. If the appVersion value corresponds to the version of Loki that Renovate detected for an upgrade, this is the correct version. So, for example, if you will be updating to chart
# version v1.13.0, your kpt command would be:

kpt pkg update chart@1.13.0 --strategy alpha-git-patch

kpt pkg update chart@${chart.version} --strategy alpha-git-patch
```

### Update dependencies in chart.yml

```
helm dependency update ./chart
```

## Update main chart

```chart/Chart.yaml```

- update harbor `version` and `appVersion`
- Ensure Big Bang version suffix is appended to chart version
- Ensure dependencies gluon, postgresql, and redis are present and up to date

```yaml
version: $VERSION-bb.0
dependencies:
  - name: postgresql
    version: $POSTGRESQL_VERSION
    repository: file://./deps/postgresql
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

- Verify that Renovate updated the image tags in `chart/values.yaml`
- For example, if Renovate wants to update harbor-core to version v2.9.0, you should see:

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
istio:
  enabled: true
  ingressGateways:
    passthrough-ingressgateway:
      enabled: false
  gateways:
    passthrough:
      enabled: false

istioOperator:
  enabled: true

monitoring:
  enabled: true

addons:
  monitoring:
    enabled: true
  harbor:
    enabled: true
    git:
      tag: null
      branch: "renovate/ironbank"
    values:
      istio:
        enabled: true
        hardened:
          enabled: true
          monitoring:
            enabled: true
      #        mtls:
      #          # -- STRICT = Allow only mutual TLS traffic,
      #          # PERMISSIVE = Allow both plain text and mutual TLS traffic
      #          mode: STRICT
      monitoring:
        enabled: true
      metrics:
        enabled: true
        serviceMonitor:
          enabled: true
      networkPolicies:
        enabled: true
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

docker pull alpine:latest 

docker tag alpine:latest harbor.dev.bigbang.mil/library/alpine:latest

docker push harbor.dev.bigbang.mil/library/alpine:latest

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
