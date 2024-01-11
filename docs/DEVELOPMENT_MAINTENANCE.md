# To upgrade the Harbor Package

Check the [upstream changelog](https://github.com/goharbor/harbor/releases) and the [upgrade notes](https://goharbor.io/docs/2.9.0/administration/upgrade/).

# Upgrading

Find the latest version of the `harbor` image that matches the latest version in IronBank that Renovate has identified from here: https://github.com/goharbor/harbor-helm

Run a KPT update against the main chart folder:
```shell
# To find the chart version for the command below:
# - Browse to the [upstream](https://github.com/goharbor/harbor-helm).
# - Click on the drop-down menu on the upper left, then on Tags.
# - Scroll through the tags until you get to the Helm chart version tags (e.g. v1.13.0, v1.12.4, etc.).
# - Starting with the most recent Helm chart version tag, open the Chart.yaml for the tag. If the appVersion value corresponds to the version of Loki that Renovate detected for an upgrade, this is the correct version. So, for example, if you will be updating to chart
# version v1.13.0, your kpt command would be:

kpt pkg update chart@v1.13.0 --strategy alpha-git-patch

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
```
helm upgrade \
  --install bigbang ./bigbang/chart \
  --create-namespace \
  --namespace bigbang \
  --values ./bigbang/chart/values.yaml \
  --values ./bigbang/chart/ingress-certs.yaml \
  --set gatekeeper.enabled=false \
  --set addons.harbor.enabled=true
```
Visit `https://harbor.bigbang.dev` and login

default credentials
```
  username: admin

  password: Harbor12345
```

From the CLI, run the following to test pushing/pulling from registry is working as expected

```
docker login harbor.bigbang.dev

# Enter default credentials

docker pull alpine:latest alpine-latest.tar

docker push alpine-latest.tar harbor.bigbang.dev/alpine:latest

```

# Chart Additions

### automountServiceAccountToken
The mutating Kyverno policy named `update-automountserviceaccounttokens` is leveraged to harden all ServiceAccounts in this package with `automountServiceAccountToken: false`. This policy is configured by namespace in the Big Bang umbrella chart repository at [chart/templates/kyverno-policies/values.yaml](https://repo1.dso.mil/big-bang/bigbang/-/blob/master/chart/templates/kyverno-policies/values.yaml?ref_type=heads).

This policy revokes access to the K8s API for Pods utilizing said ServiceAccounts. If a Pod truly requires access to the K8s API (for app functionality), the Pod is added to the `pods:` array of the same mutating policy. This grants the Pod access to the API, and creates a Kyverno PolicyException to prevent an alert.
