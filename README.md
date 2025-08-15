<!-- Warning: Do not manually edit this file. See notes on gluon + helm-docs at the end of this file for more information. -->
# harbor

![Version: 1.17.2-bb.1](https://img.shields.io/badge/Version-1.17.2--bb.1-informational?style=flat-square) ![AppVersion: 2.13.2](https://img.shields.io/badge/AppVersion-2.13.2-informational?style=flat-square) ![Maintenance Track: bb_integrated](https://img.shields.io/badge/Maintenance_Track-bb_integrated-green?style=flat-square)

An open source trusted cloud native registry that stores, signs, and scans content

## Upstream References

- <https://goharbor.io>
- <https://github.com/goharbor/harbor>
- <https://github.com/goharbor/harbor-helm>

## Upstream Release Notes

This package has no upstream release note links on file. Please add some to [chart/Chart.yaml](chart/Chart.yaml) under `annotations.bigbang.dev/upstreamReleaseNotesMarkdown`.
Example:
```yaml
annotations:
  bigbang.dev/upstreamReleaseNotesMarkdown: |
    - [Find our upstream chart's CHANGELOG here](https://link-goes-here/CHANGELOG.md)
    - [and our upstream application release notes here](https://another-link-here/RELEASE_NOTES.md)
```

## Learn More

- [Application Overview](docs/overview.md)
- [Other Documentation](docs/)

## Pre-Requisites

- Kubernetes Cluster deployed
- Kubernetes config installed in `~/.kube/config`
- Helm installed

Install Helm

https://helm.sh/docs/intro/install/

## Deployment

- Clone down the repository
- cd into directory

```bash
helm install harbor chart/
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| domain | string | `"dev.bigbang.mil"` |  |
| istio.enabled | bool | `false` |  |
| istio.hardened.enabled | bool | `false` |  |
| istio.hardened.customAuthorizationPolicies | list | `[]` |  |
| istio.hardened.monitoring.enabled | bool | `false` |  |
| istio.hardened.monitoring.namespaces[0] | string | `"monitoring"` |  |
| istio.hardened.monitoring.principals[0] | string | `"cluster.local/ns/monitoring/sa/monitoring-monitoring-kube-prometheus"` |  |
| istio.hardened.outboundTrafficPolicyMode | string | `"REGISTRY_ONLY"` |  |
| istio.hardened.customServiceEntries | list | `[]` |  |
| istio.mtls.mode | string | `"STRICT"` | STRICT = Allow only mutual TLS traffic, PERMISSIVE = Allow both plain text and mutual TLS traffic |
| istio.harbor.gateways[0] | string | `"istio-system/public"` |  |
| istio.harbor.hosts[0] | string | `"harbor.{{ .Values.domain }}"` |  |
| istio.injection | string | `"disabled"` |  |
| monitoring.enabled | bool | `false` |  |
| monitoring.namespace | string | `"monitoring"` |  |
| networkPolicies.enabled | bool | `false` |  |
| networkPolicies.ingressLabels.app | string | `"istio-ingressgateway"` |  |
| networkPolicies.ingressLabels.istio | string | `"ingressgateway"` |  |
| networkPolicies.additionalPolicies | list | `[]` |  |
| openshift | bool | `false` |  |
| bbtests.enabled | bool | `false` |  |
| bbtests.cypress.artifacts | bool | `true` |  |
| bbtests.cypress.envs.cypress_url | string | `"http://harbor:80"` |  |
| bbtests.cypress.envs.cypress_user | string | `"admin"` |  |
| bbtests.cypress.envs.cypress_harbor_password | string | `"Harbor12345"` |  |
| bbtests.cypress.envs.cypress_project | string | `"bbcypress-test"` |  |
| bbtests.scripts.image | string | `"registry1.dso.mil/bigbang-ci/devops-tester:1.1.2"` |  |
| bbtests.scripts.additionalVolumes[0].name | string | `"docker-config"` |  |
| bbtests.scripts.additionalVolumes[0].secret.secretName | string | `"private-registry"` |  |
| bbtests.scripts.additionalVolumes[0].secret.items[0].key | string | `".dockerconfigjson"` |  |
| bbtests.scripts.additionalVolumes[0].secret.items[0].path | string | `"auth.json"` |  |
| bbtests.scripts.additionalVolumeMounts[0].name | string | `"docker-config"` |  |
| bbtests.scripts.additionalVolumeMounts[0].mountPath | string | `"/.docker/"` |  |
| bbtests.scripts.envs.HARBOR_USER | string | `"admin"` |  |
| bbtests.scripts.envs.HARBOR_PASS | string | `"Harbor12345"` |  |
| bbtests.scripts.envs.HARBOR_REGISTRY | string | `"harbor-core:80"` |  |
| bbtests.scripts.envs.HARBOR_PROJECT | string | `"library"` |  |
| postgresql.enabled | bool | `true` |  |
| postgresql.auth.username | string | `"harborUser"` |  |
| postgresql.auth.password | string | `"harborPW"` |  |
| postgresql.auth.database | string | `"harborUser"` |  |
| postgresql.maxIdleConns | int | `100` |  |
| postgresql.maxOpenConns | int | `900` |  |
| postgresql.networkPolicy.enabled | bool | `false` |  |
| postgresql.global.imagePullSecrets[0] | string | `"private-registry"` |  |
| postgresql.global.security.allowInsecureImages | bool | `true` |  |
| postgresql.image.registry | string | `"registry1.dso.mil"` |  |
| postgresql.image.repository | string | `"ironbank/opensource/postgres/postgresql"` |  |
| postgresql.image.tag | string | `"17.5"` |  |
| postgresql.image.debug | bool | `true` |  |
| postgresql.securityContext.enabled | bool | `true` |  |
| postgresql.securityContext.fsGroup | int | `1001` |  |
| postgresql.securityContext.runAsUser | int | `1001` |  |
| postgresql.securityContext.runAsGroup | int | `1001` |  |
| postgresql.primary.extraVolumeMounts[0].name | string | `"runtime"` |  |
| postgresql.primary.extraVolumeMounts[0].mountPath | string | `"/var/run/postgresql"` |  |
| postgresql.primary.extraVolumes[0].name | string | `"runtime"` |  |
| postgresql.primary.extraVolumes[0].emptyDir | object | `{}` |  |
| postgresql.primary.containerSecurityContext.enabled | bool | `true` |  |
| postgresql.primary.containerSecurityContext.runAsUser | int | `1001` |  |
| postgresql.primary.containerSecurityContext.runAsGroup | int | `1001` |  |
| postgresql.primary.containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| postgresql.existingSecret | string | `""` |  |
| postgresql.resources.requests.cpu | string | `"250m"` |  |
| postgresql.resources.requests.memory | string | `"256Mi"` |  |
| postgresql.resources.limits.cpu | string | `"250m"` |  |
| postgresql.resources.limits.memory | string | `"256Mi"` |  |
| postgresql.podAnnotations | object | `{}` |  |
| postgresql.initdbUser | string | `"harborUser"` |  |
| postgresql.initdbPassword | string | `"harborPW"` |  |
| postgresql.externalDatabase.host | string | `"localhost"` |  |
| postgresql.externalDatabase.port | int | `5432` |  |
| postgresql.externalDatabase.user | string | `"bn_harbor"` |  |
| postgresql.externalDatabase.password | string | `""` |  |
| postgresql.externalDatabase.sslmode | string | `"disable"` |  |
| postgresql.externalDatabase.coreDatabase | string | `""` |  |
| postgresql.podLabels | object | `{}` |  |
| redis-bb.enabled | bool | `true` | Enable BigBang provided redis sub-chart. Disable if using external cloud elasticache or redis endpoint and fill in `redis.external.addr` in above section |
| redis-bb.auth.enabled | bool | `false` |  |
| redis-bb.istio.redis.enabled | bool | `false` |  |
| redis-bb.image.registry | string | `"registry1.dso.mil"` |  |
| redis-bb.image.repository | string | `"ironbank/bitnami/redis"` |  |
| redis-bb.image.tag | string | `"8.2.0"` |  |
| redis-bb.image.pullSecrets[0] | string | `"private-registry"` |  |
| redis-bb.networkPolicies.enabled | bool | `true` |  |
| redis-bb.networkPolicies.controlPlaneCidr | string | `"0.0.0.0/0"` |  |
| redis-bb.master.containerSecurityContext.enabled | bool | `true` |  |
| redis-bb.master.containerSecurityContext.runAsUser | int | `1000` |  |
| redis-bb.master.containerSecurityContext.runAsGroup | int | `1000` |  |
| redis-bb.master.containerSecurityContext.runAsNonRoot | bool | `true` |  |
| redis-bb.replica.replicaCount | int | `0` |  |
| redis-bb.replica.containerSecurityContext.enabled | bool | `true` |  |
| redis-bb.replica.containerSecurityContext.runAsUser | int | `1000` |  |
| redis-bb.replica.containerSecurityContext.runAsGroup | int | `1000` |  |
| redis-bb.replica.containerSecurityContext.runAsNonRoot | bool | `true` |  |
| redis-bb.commonConfiguration | string | `"# Enable AOF https://redis.io/topics/persistence#append-only-file\nappendonly no\nmaxmemory 200mb\nmaxmemory-policy allkeys-lru\nsave \"\""` |  |
| redis-bb.podLabels | object | `{}` |  |
| upstream.imagePullSecrets[0].name | string | `"private-registry"` |  |
| upstream.containerSecurityContext.runAsGroup | int | `1000` |  |
| upstream.containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| upstream.nginx.image.repository | string | `"registry1.dso.mil/ironbank/opensource/nginx/nginx"` |  |
| upstream.nginx.image.tag | string | `"1.29.1"` |  |
| upstream.nginx.image.pullSecrets[0] | string | `"private-registry"` |  |
| upstream.nginx.serviceAccountName | string | `""` |  |
| upstream.nginx.automountServiceAccountToken | bool | `false` |  |
| upstream.nginx.replicas | int | `1` |  |
| upstream.nginx.revisionHistoryLimit | int | `10` |  |
| upstream.nginx.resources.requests.memory | string | `"256Mi"` |  |
| upstream.nginx.resources.requests.cpu | string | `"100m"` |  |
| upstream.nginx.resources.limits.cpu | string | `"100m"` |  |
| upstream.nginx.resources.limits.memory | string | `"256Mi"` |  |
| upstream.portal.image.repository | string | `"registry1.dso.mil/ironbank/opensource/goharbor/harbor-portal"` |  |
| upstream.portal.image.tag | string | `"v2.13.2"` |  |
| upstream.portal.image.pullSecrets[0] | string | `"private-registry"` |  |
| upstream.portal.serviceAccountName | string | `""` |  |
| upstream.portal.automountServiceAccountToken | bool | `false` |  |
| upstream.portal.replicas | int | `1` |  |
| upstream.portal.revisionHistoryLimit | int | `10` |  |
| upstream.portal.resources.requests.memory | string | `"256Mi"` |  |
| upstream.portal.resources.requests.cpu | string | `"100m"` |  |
| upstream.portal.resources.limits.cpu | string | `"100m"` |  |
| upstream.portal.resources.limits.memory | string | `"256Mi"` |  |
| upstream.core.image.repository | string | `"registry1.dso.mil/ironbank/opensource/goharbor/harbor-core"` |  |
| upstream.core.image.tag | string | `"v2.13.2"` |  |
| upstream.core.image.pullSecrets[0] | string | `"private-registry"` |  |
| upstream.core.serviceAccountName | string | `""` |  |
| upstream.core.automountServiceAccountToken | bool | `false` |  |
| upstream.core.replicas | int | `1` |  |
| upstream.core.revisionHistoryLimit | int | `10` |  |
| upstream.core.startupProbe.enabled | bool | `true` |  |
| upstream.core.startupProbe.initialDelaySeconds | int | `30` |  |
| upstream.core.resources.requests.memory | string | `"256Mi"` |  |
| upstream.core.resources.requests.cpu | string | `"100m"` |  |
| upstream.core.resources.limits.cpu | string | `"100m"` |  |
| upstream.core.resources.limits.memory | string | `"256Mi"` |  |
| upstream.jobservice.image.repository | string | `"registry1.dso.mil/ironbank/opensource/goharbor/harbor-jobservice"` |  |
| upstream.jobservice.image.tag | string | `"v2.13.2"` |  |
| upstream.jobservice.image.pullSecrets[0] | string | `"private-registry"` |  |
| upstream.jobservice.serviceAccountName | string | `""` |  |
| upstream.jobservice.automountServiceAccountToken | bool | `false` |  |
| upstream.jobservice.replicas | int | `1` |  |
| upstream.jobservice.revisionHistoryLimit | int | `10` |  |
| upstream.jobservice.resources.requests.memory | string | `"256Mi"` |  |
| upstream.jobservice.resources.requests.cpu | string | `"100m"` |  |
| upstream.jobservice.resources.limits.cpu | string | `"100m"` |  |
| upstream.jobservice.resources.limits.memory | string | `"256Mi"` |  |
| upstream.registry.registry.image.repository | string | `"registry1.dso.mil/ironbank/opensource/goharbor/registry"` |  |
| upstream.registry.registry.image.tag | string | `"v2.13.2"` |  |
| upstream.registry.registry.image.pullSecrets[0] | string | `"private-registry"` |  |
| upstream.registry.registry.resources.requests.memory | string | `"256Mi"` |  |
| upstream.registry.registry.resources.requests.cpu | string | `"100m"` |  |
| upstream.registry.registry.resources.limits.cpu | string | `"100m"` |  |
| upstream.registry.registry.resources.limits.memory | string | `"256Mi"` |  |
| upstream.registry.registry.extraEnvVars | list | `[]` |  |
| upstream.registry.controller.image.repository | string | `"registry1.dso.mil/ironbank/opensource/goharbor/harbor-registryctl"` |  |
| upstream.registry.controller.image.tag | string | `"v2.13.2"` |  |
| upstream.registry.controller.image.pullSecrets[0] | string | `"private-registry"` |  |
| upstream.registry.controller.resources.requests.memory | string | `"256Mi"` |  |
| upstream.registry.controller.resources.requests.cpu | string | `"100m"` |  |
| upstream.registry.controller.resources.limits.cpu | string | `"100m"` |  |
| upstream.registry.controller.resources.limits.memory | string | `"256Mi"` |  |
| upstream.trivy.enabled | bool | `true` |  |
| upstream.trivy.image.repository | string | `"registry1.dso.mil/ironbank/opensource/goharbor/trivy-adapter"` |  |
| upstream.trivy.image.tag | string | `"v2.13.2"` |  |
| upstream.trivy.image.pullSecrets[0] | string | `"private-registry"` |  |
| upstream.trivy.serviceAccountName | string | `""` |  |
| upstream.trivy.automountServiceAccountToken | bool | `false` |  |
| upstream.trivy.replicas | int | `1` |  |
| upstream.trivy.resources.requests.cpu | string | `"200m"` |  |
| upstream.trivy.resources.requests.memory | string | `"512Mi"` |  |
| upstream.trivy.resources.limits.cpu | int | `1` |  |
| upstream.trivy.resources.limits.memory | string | `"1Gi"` |  |
| upstream.database.maxIdleConns | string | `"100"` |  |
| upstream.database.maxOpenConns | string | `"1000"` |  |
| upstream.database.type | string | `"external"` |  |
| upstream.database.internal.image.repository | string | `"goharbor/harbor-db"` |  |
| upstream.database.internal.image.tag | string | `"v2.13.2"` |  |
| upstream.database.internal.serviceAccountName | string | `""` |  |
| upstream.database.internal.automountServiceAccountToken | bool | `false` |  |
| upstream.database.internal.password | string | `"changeit"` |  |
| upstream.database.internal.shmSizeLimit | string | `"512Mi"` |  |
| upstream.database.internal.resources.requests.memory | string | `"256Mi"` |  |
| upstream.database.internal.resources.requests.cpu | string | `"100m"` |  |
| upstream.database.internal.resources.limits.cpu | string | `"100m"` |  |
| upstream.database.internal.resources.limits.memory | string | `"256Mi"` |  |
| upstream.database.internal.initContainer.migrator | object | `{}` |  |
| upstream.database.internal.initContainer.resources.requests.memory | string | `"128Mi"` |  |
| upstream.database.internal.initContainer.resources.requests.cpu | string | `"100m"` |  |
| upstream.database.internal.initContainer.resources.limits.cpu | string | `"100m"` |  |
| upstream.database.internal.initContainer.resources.limits.memory | string | `"128Mi"` |  |
| upstream.database.internal.initContainer.permissions | object | `{}` |  |
| upstream.database.external.host | string | `"harbor-postgresql"` |  |
| upstream.database.external.port | string | `"5432"` |  |
| upstream.database.external.username | string | `"harborUser"` |  |
| upstream.database.external.password | string | `"harborPW"` |  |
| upstream.database.external.coreDatabase | string | `"harborUser"` |  |
| upstream.redis.type | string | `"external"` |  |
| upstream.redis.internal.image.repository | string | `"goharbor/redis-photon"` |  |
| upstream.redis.internal.image.tag | string | `"v2.13.2"` |  |
| upstream.redis.internal.image.pullSecrets[0] | string | `"private-registry"` |  |
| upstream.redis.internal.serviceAccountName | string | `""` |  |
| upstream.redis.internal.automountServiceAccountToken | bool | `false` |  |
| upstream.redis.internal.resources.requests.memory | string | `"256Mi"` |  |
| upstream.redis.internal.resources.requests.cpu | string | `"100m"` |  |
| upstream.redis.internal.resources.limits.memory | string | `"256Mi"` |  |
| upstream.redis.internal.resources.limits.cpu | string | `"100m"` |  |
| upstream.redis.external.addr | string | `"harbor-redis-bb-master:6379"` |  |
| upstream.exporter.image.repository | string | `"registry1.dso.mil/ironbank/opensource/goharbor/harbor-exporter"` |  |
| upstream.exporter.image.tag | string | `"v2.13.2"` |  |
| upstream.exporter.image.pullSecrets[0] | string | `"private-registry"` |  |
| upstream.exporter.serviceAccountName | string | `""` |  |
| upstream.exporter.automountServiceAccountToken | bool | `false` |  |
| upstream.exporter.replicas | int | `1` |  |
| upstream.exporter.revisionHistoryLimit | int | `10` |  |
| upstream.exporter.resources.requests.memory | string | `"256Mi"` |  |
| upstream.exporter.resources.requests.cpu | string | `"100m"` |  |
| upstream.exporter.resources.limits.cpu | string | `"100m"` |  |
| upstream.exporter.resources.limits.memory | string | `"256Mi"` |  |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.

---

_This file is programatically generated using `helm-docs` and some BigBang-specific templates. The `gluon` repository has [instructions for regenerating package READMEs](https://repo1.dso.mil/big-bang/product/packages/gluon/-/blob/master/docs/bb-package-readme.md)._

