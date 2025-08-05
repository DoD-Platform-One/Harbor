<!-- Warning: Do not manually edit this file. See notes on gluon + helm-docs at the end of this file for more information. -->
# harbor

![Version: 1.17.1-bb.4](https://img.shields.io/badge/Version-1.17.1--bb.4-informational?style=flat-square) ![AppVersion: 2.13.1](https://img.shields.io/badge/AppVersion-2.13.1-informational?style=flat-square) ![Maintenance Track: bb_integrated](https://img.shields.io/badge/Maintenance_Track-bb_integrated-green?style=flat-square)

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
| upstream.expose.type | string | `"ingress"` |  |
| upstream.expose.tls.enabled | bool | `true` |  |
| upstream.expose.tls.certSource | string | `"auto"` |  |
| upstream.expose.tls.auto.commonName | string | `""` |  |
| upstream.expose.tls.secret.secretName | string | `""` |  |
| upstream.expose.ingress.hosts.core | string | `"core.harbor.domain"` |  |
| upstream.expose.ingress.controller | string | `"default"` |  |
| upstream.expose.ingress.kubeVersionOverride | string | `""` |  |
| upstream.expose.ingress.className | string | `""` |  |
| upstream.expose.ingress.annotations."ingress.kubernetes.io/ssl-redirect" | string | `"true"` |  |
| upstream.expose.ingress.annotations."ingress.kubernetes.io/proxy-body-size" | string | `"0"` |  |
| upstream.expose.ingress.annotations."nginx.ingress.kubernetes.io/ssl-redirect" | string | `"true"` |  |
| upstream.expose.ingress.annotations."nginx.ingress.kubernetes.io/proxy-body-size" | string | `"0"` |  |
| upstream.expose.ingress.labels | object | `{}` |  |
| upstream.expose.clusterIP.name | string | `"harbor"` |  |
| upstream.expose.clusterIP.staticClusterIP | string | `""` |  |
| upstream.expose.clusterIP.ports.httpPort | int | `80` |  |
| upstream.expose.clusterIP.ports.httpsPort | int | `443` |  |
| upstream.expose.clusterIP.annotations | object | `{}` |  |
| upstream.expose.clusterIP.labels | object | `{}` |  |
| upstream.expose.nodePort.name | string | `"harbor"` |  |
| upstream.expose.nodePort.ports.http.port | int | `80` |  |
| upstream.expose.nodePort.ports.http.nodePort | int | `30002` |  |
| upstream.expose.nodePort.ports.https.port | int | `443` |  |
| upstream.expose.nodePort.ports.https.nodePort | int | `30003` |  |
| upstream.expose.nodePort.annotations | object | `{}` |  |
| upstream.expose.nodePort.labels | object | `{}` |  |
| upstream.expose.loadBalancer.name | string | `"harbor"` |  |
| upstream.expose.loadBalancer.IP | string | `""` |  |
| upstream.expose.loadBalancer.ports.httpPort | int | `80` |  |
| upstream.expose.loadBalancer.ports.httpsPort | int | `443` |  |
| upstream.expose.loadBalancer.annotations | object | `{}` |  |
| upstream.expose.loadBalancer.labels | object | `{}` |  |
| upstream.expose.loadBalancer.sourceRanges | list | `[]` |  |
| upstream.externalURL | string | `"https://core.harbor.domain"` |  |
| upstream.persistence.enabled | bool | `true` |  |
| upstream.persistence.resourcePolicy | string | `"keep"` |  |
| upstream.persistence.persistentVolumeClaim.registry.existingClaim | string | `""` |  |
| upstream.persistence.persistentVolumeClaim.registry.storageClass | string | `""` |  |
| upstream.persistence.persistentVolumeClaim.registry.subPath | string | `""` |  |
| upstream.persistence.persistentVolumeClaim.registry.accessMode | string | `"ReadWriteOnce"` |  |
| upstream.persistence.persistentVolumeClaim.registry.size | string | `"5Gi"` |  |
| upstream.persistence.persistentVolumeClaim.registry.annotations | object | `{}` |  |
| upstream.persistence.persistentVolumeClaim.jobservice.jobLog.existingClaim | string | `""` |  |
| upstream.persistence.persistentVolumeClaim.jobservice.jobLog.storageClass | string | `""` |  |
| upstream.persistence.persistentVolumeClaim.jobservice.jobLog.subPath | string | `""` |  |
| upstream.persistence.persistentVolumeClaim.jobservice.jobLog.accessMode | string | `"ReadWriteOnce"` |  |
| upstream.persistence.persistentVolumeClaim.jobservice.jobLog.size | string | `"1Gi"` |  |
| upstream.persistence.persistentVolumeClaim.jobservice.jobLog.annotations | object | `{}` |  |
| upstream.persistence.persistentVolumeClaim.jobservice.scanDataExports.existingClaim | string | `""` |  |
| upstream.persistence.persistentVolumeClaim.jobservice.scanDataExports.storageClass | string | `""` |  |
| upstream.persistence.persistentVolumeClaim.jobservice.scanDataExports.subPath | string | `""` |  |
| upstream.persistence.persistentVolumeClaim.jobservice.scanDataExports.accessMode | string | `"ReadWriteOnce"` |  |
| upstream.persistence.persistentVolumeClaim.jobservice.scanDataExports.size | string | `"1Gi"` |  |
| upstream.persistence.persistentVolumeClaim.jobservice.scanDataExports.annotations | object | `{}` |  |
| upstream.persistence.persistentVolumeClaim.database.existingClaim | string | `""` |  |
| upstream.persistence.persistentVolumeClaim.database.storageClass | string | `""` |  |
| upstream.persistence.persistentVolumeClaim.database.subPath | string | `""` |  |
| upstream.persistence.persistentVolumeClaim.database.accessMode | string | `"ReadWriteOnce"` |  |
| upstream.persistence.persistentVolumeClaim.database.size | string | `"1Gi"` |  |
| upstream.persistence.persistentVolumeClaim.database.annotations | object | `{}` |  |
| upstream.persistence.persistentVolumeClaim.redis.existingClaim | string | `""` |  |
| upstream.persistence.persistentVolumeClaim.redis.storageClass | string | `""` |  |
| upstream.persistence.persistentVolumeClaim.redis.subPath | string | `""` |  |
| upstream.persistence.persistentVolumeClaim.redis.accessMode | string | `"ReadWriteOnce"` |  |
| upstream.persistence.persistentVolumeClaim.redis.size | string | `"1Gi"` |  |
| upstream.persistence.persistentVolumeClaim.redis.annotations | object | `{}` |  |
| upstream.persistence.persistentVolumeClaim.trivy.existingClaim | string | `""` |  |
| upstream.persistence.persistentVolumeClaim.trivy.storageClass | string | `""` |  |
| upstream.persistence.persistentVolumeClaim.trivy.subPath | string | `""` |  |
| upstream.persistence.persistentVolumeClaim.trivy.accessMode | string | `"ReadWriteOnce"` |  |
| upstream.persistence.persistentVolumeClaim.trivy.size | string | `"5Gi"` |  |
| upstream.persistence.persistentVolumeClaim.trivy.annotations | object | `{}` |  |
| upstream.persistence.imageChartStorage.disableredirect | bool | `false` |  |
| upstream.persistence.imageChartStorage.type | string | `"filesystem"` |  |
| upstream.persistence.imageChartStorage.filesystem.rootdirectory | string | `"/storage"` |  |
| upstream.persistence.imageChartStorage.azure.accountname | string | `"accountname"` |  |
| upstream.persistence.imageChartStorage.azure.accountkey | string | `"base64encodedaccountkey"` |  |
| upstream.persistence.imageChartStorage.azure.container | string | `"containername"` |  |
| upstream.persistence.imageChartStorage.azure.existingSecret | string | `""` |  |
| upstream.persistence.imageChartStorage.gcs.bucket | string | `"bucketname"` |  |
| upstream.persistence.imageChartStorage.gcs.encodedkey | string | `"base64-encoded-json-key-file"` |  |
| upstream.persistence.imageChartStorage.gcs.existingSecret | string | `""` |  |
| upstream.persistence.imageChartStorage.gcs.useWorkloadIdentity | bool | `false` |  |
| upstream.persistence.imageChartStorage.s3.region | string | `"us-west-1"` |  |
| upstream.persistence.imageChartStorage.s3.bucket | string | `"bucketname"` |  |
| upstream.persistence.imageChartStorage.swift.authurl | string | `"https://storage.myprovider.com/v3/auth"` |  |
| upstream.persistence.imageChartStorage.swift.username | string | `"username"` |  |
| upstream.persistence.imageChartStorage.swift.password | string | `"password"` |  |
| upstream.persistence.imageChartStorage.swift.container | string | `"containername"` |  |
| upstream.persistence.imageChartStorage.swift.existingSecret | string | `""` |  |
| upstream.persistence.imageChartStorage.oss.accesskeyid | string | `"accesskeyid"` |  |
| upstream.persistence.imageChartStorage.oss.accesskeysecret | string | `"accesskeysecret"` |  |
| upstream.persistence.imageChartStorage.oss.region | string | `"regionname"` |  |
| upstream.persistence.imageChartStorage.oss.bucket | string | `"bucketname"` |  |
| upstream.persistence.imageChartStorage.oss.existingSecret | string | `""` |  |
| upstream.existingSecretAdminPasswordKey | string | `"HARBOR_ADMIN_PASSWORD"` |  |
| upstream.harborAdminPassword | string | `"Harbor12345"` |  |
| upstream.internalTLS.enabled | bool | `false` |  |
| upstream.internalTLS.strong_ssl_ciphers | bool | `false` |  |
| upstream.internalTLS.certSource | string | `"auto"` |  |
| upstream.internalTLS.trustCa | string | `""` |  |
| upstream.internalTLS.core.secretName | string | `""` |  |
| upstream.internalTLS.core.crt | string | `""` |  |
| upstream.internalTLS.core.key | string | `""` |  |
| upstream.internalTLS.jobservice.secretName | string | `""` |  |
| upstream.internalTLS.jobservice.crt | string | `""` |  |
| upstream.internalTLS.jobservice.key | string | `""` |  |
| upstream.internalTLS.registry.secretName | string | `""` |  |
| upstream.internalTLS.registry.crt | string | `""` |  |
| upstream.internalTLS.registry.key | string | `""` |  |
| upstream.internalTLS.portal.secretName | string | `""` |  |
| upstream.internalTLS.portal.crt | string | `""` |  |
| upstream.internalTLS.portal.key | string | `""` |  |
| upstream.internalTLS.trivy.secretName | string | `""` |  |
| upstream.internalTLS.trivy.crt | string | `""` |  |
| upstream.internalTLS.trivy.key | string | `""` |  |
| upstream.ipFamily.ipv6.enabled | bool | `true` |  |
| upstream.ipFamily.ipv4.enabled | bool | `true` |  |
| upstream.imagePullPolicy | string | `"IfNotPresent"` |  |
| upstream.imagePullSecrets[0].name | string | `"private-registry"` |  |
| upstream.updateStrategy.type | string | `"RollingUpdate"` |  |
| upstream.logLevel | string | `"info"` |  |
| upstream.caSecretName | string | `""` |  |
| upstream.secretKey | string | `"not-a-secure-key"` |  |
| upstream.existingSecretSecretKey | string | `""` |  |
| upstream.proxy.httpProxy | string | `nil` |  |
| upstream.proxy.httpsProxy | string | `nil` |  |
| upstream.proxy.noProxy | string | `"127.0.0.1,localhost,.local,.internal"` |  |
| upstream.proxy.components[0] | string | `"core"` |  |
| upstream.proxy.components[1] | string | `"jobservice"` |  |
| upstream.proxy.components[2] | string | `"trivy"` |  |
| upstream.enableMigrateHelmHook | bool | `false` |  |
| upstream.metrics.enabled | bool | `false` |  |
| upstream.metrics.core.path | string | `"/metrics"` |  |
| upstream.metrics.core.port | int | `8001` |  |
| upstream.metrics.registry.path | string | `"/metrics"` |  |
| upstream.metrics.registry.port | int | `8001` |  |
| upstream.metrics.jobservice.path | string | `"/metrics"` |  |
| upstream.metrics.jobservice.port | int | `8001` |  |
| upstream.metrics.exporter.path | string | `"/metrics"` |  |
| upstream.metrics.exporter.port | int | `8001` |  |
| upstream.metrics.serviceMonitor.enabled | bool | `false` |  |
| upstream.metrics.serviceMonitor.additionalLabels | object | `{}` |  |
| upstream.metrics.serviceMonitor.interval | string | `""` |  |
| upstream.metrics.serviceMonitor.metricRelabelings | list | `[]` |  |
| upstream.metrics.serviceMonitor.relabelings | list | `[]` |  |
| upstream.trace.enabled | bool | `false` |  |
| upstream.trace.provider | string | `"jaeger"` |  |
| upstream.trace.sample_rate | int | `1` |  |
| upstream.trace.jaeger.endpoint | string | `"http://hostname:14268/api/traces"` |  |
| upstream.trace.otel.endpoint | string | `"hostname:4318"` |  |
| upstream.trace.otel.url_path | string | `"/v1/traces"` |  |
| upstream.trace.otel.compression | bool | `false` |  |
| upstream.trace.otel.insecure | bool | `true` |  |
| upstream.trace.otel.timeout | int | `10` |  |
| upstream.cache.enabled | bool | `false` |  |
| upstream.cache.expireHours | int | `24` |  |
| upstream.containerSecurityContext.runAsGroup | int | `1000` |  |
| upstream.containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| upstream.nginx.image.repository | string | `"registry1.dso.mil/ironbank/opensource/nginx/nginx"` |  |
| upstream.nginx.image.tag | string | `"1.29.0"` |  |
| upstream.nginx.image.pullSecrets[0] | string | `"private-registry"` |  |
| upstream.nginx.serviceAccountName | string | `""` |  |
| upstream.nginx.automountServiceAccountToken | bool | `false` |  |
| upstream.nginx.replicas | int | `1` |  |
| upstream.nginx.revisionHistoryLimit | int | `10` |  |
| upstream.nginx.resources.requests.memory | string | `"256Mi"` |  |
| upstream.nginx.resources.requests.cpu | string | `"100m"` |  |
| upstream.nginx.resources.limits.cpu | string | `"100m"` |  |
| upstream.nginx.resources.limits.memory | string | `"256Mi"` |  |
| upstream.nginx.extraEnvVars | list | `[]` |  |
| upstream.nginx.nodeSelector | object | `{}` |  |
| upstream.nginx.tolerations | list | `[]` |  |
| upstream.nginx.affinity | object | `{}` |  |
| upstream.nginx.topologySpreadConstraints | list | `[]` |  |
| upstream.nginx.podAnnotations | object | `{}` |  |
| upstream.nginx.podLabels | object | `{}` |  |
| upstream.nginx.priorityClassName | string | `nil` |  |
| upstream.portal.image.repository | string | `"registry1.dso.mil/ironbank/opensource/goharbor/harbor-portal"` |  |
| upstream.portal.image.tag | string | `"v2.13.1"` |  |
| upstream.portal.image.pullSecrets[0] | string | `"private-registry"` |  |
| upstream.portal.serviceAccountName | string | `""` |  |
| upstream.portal.automountServiceAccountToken | bool | `false` |  |
| upstream.portal.replicas | int | `1` |  |
| upstream.portal.revisionHistoryLimit | int | `10` |  |
| upstream.portal.resources.requests.memory | string | `"256Mi"` |  |
| upstream.portal.resources.requests.cpu | string | `"100m"` |  |
| upstream.portal.resources.limits.cpu | string | `"100m"` |  |
| upstream.portal.resources.limits.memory | string | `"256Mi"` |  |
| upstream.portal.extraEnvVars | list | `[]` |  |
| upstream.portal.nodeSelector | object | `{}` |  |
| upstream.portal.tolerations | list | `[]` |  |
| upstream.portal.affinity | object | `{}` |  |
| upstream.portal.topologySpreadConstraints | list | `[]` |  |
| upstream.portal.podAnnotations | object | `{}` |  |
| upstream.portal.podLabels | object | `{}` |  |
| upstream.portal.serviceAnnotations | object | `{}` |  |
| upstream.portal.priorityClassName | string | `nil` |  |
| upstream.portal.initContainers | list | `[]` |  |
| upstream.core.image.repository | string | `"registry1.dso.mil/ironbank/opensource/goharbor/harbor-core"` |  |
| upstream.core.image.tag | string | `"v2.13.1"` |  |
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
| upstream.core.extraEnvVars | list | `[]` |  |
| upstream.core.nodeSelector | object | `{}` |  |
| upstream.core.tolerations | list | `[]` |  |
| upstream.core.affinity | object | `{}` |  |
| upstream.core.topologySpreadConstraints | list | `[]` |  |
| upstream.core.podAnnotations | object | `{}` |  |
| upstream.core.podLabels | object | `{}` |  |
| upstream.core.serviceAnnotations | object | `{}` |  |
| upstream.core.priorityClassName | string | `nil` |  |
| upstream.core.initContainers | list | `[]` |  |
| upstream.core.configureUserSettings | string | `nil` |  |
| upstream.core.quotaUpdateProvider | string | `"db"` |  |
| upstream.core.secret | string | `""` |  |
| upstream.core.existingSecret | string | `""` |  |
| upstream.core.secretName | string | `""` |  |
| upstream.core.tokenKey | string | `nil` |  |
| upstream.core.tokenCert | string | `nil` |  |
| upstream.core.xsrfKey | string | `""` |  |
| upstream.core.existingXsrfSecret | string | `""` |  |
| upstream.core.existingXsrfSecretKey | string | `"CSRF_KEY"` |  |
| upstream.core.artifactPullAsyncFlushDuration | string | `nil` |  |
| upstream.core.gdpr.deleteUser | bool | `false` |  |
| upstream.core.gdpr.auditLogsCompliant | bool | `false` |  |
| upstream.jobservice.image.repository | string | `"registry1.dso.mil/ironbank/opensource/goharbor/harbor-jobservice"` |  |
| upstream.jobservice.image.tag | string | `"v2.13.1"` |  |
| upstream.jobservice.image.pullSecrets[0] | string | `"private-registry"` |  |
| upstream.jobservice.serviceAccountName | string | `""` |  |
| upstream.jobservice.automountServiceAccountToken | bool | `false` |  |
| upstream.jobservice.replicas | int | `1` |  |
| upstream.jobservice.revisionHistoryLimit | int | `10` |  |
| upstream.jobservice.resources.requests.memory | string | `"256Mi"` |  |
| upstream.jobservice.resources.requests.cpu | string | `"100m"` |  |
| upstream.jobservice.resources.limits.cpu | string | `"100m"` |  |
| upstream.jobservice.resources.limits.memory | string | `"256Mi"` |  |
| upstream.jobservice.extraEnvVars | list | `[]` |  |
| upstream.jobservice.nodeSelector | object | `{}` |  |
| upstream.jobservice.tolerations | list | `[]` |  |
| upstream.jobservice.affinity | object | `{}` |  |
| upstream.jobservice.topologySpreadConstraints | string | `nil` |  |
| upstream.jobservice.podAnnotations | object | `{}` |  |
| upstream.jobservice.podLabels | object | `{}` |  |
| upstream.jobservice.priorityClassName | string | `nil` |  |
| upstream.jobservice.initContainers | list | `[]` |  |
| upstream.jobservice.maxJobWorkers | int | `10` |  |
| upstream.jobservice.jobLoggers[0] | string | `"file"` |  |
| upstream.jobservice.loggerSweeperDuration | int | `14` |  |
| upstream.jobservice.notification.webhook_job_max_retry | int | `3` |  |
| upstream.jobservice.notification.webhook_job_http_client_timeout | int | `3` |  |
| upstream.jobservice.reaper.max_update_hours | int | `24` |  |
| upstream.jobservice.reaper.max_dangling_hours | int | `168` |  |
| upstream.jobservice.secret | string | `""` |  |
| upstream.jobservice.existingSecret | string | `""` |  |
| upstream.jobservice.existingSecretKey | string | `"JOBSERVICE_SECRET"` |  |
| upstream.registry.registry.image.repository | string | `"registry1.dso.mil/ironbank/opensource/goharbor/registry"` |  |
| upstream.registry.registry.image.tag | string | `"v2.13.1"` |  |
| upstream.registry.registry.image.pullSecrets[0] | string | `"private-registry"` |  |
| upstream.registry.registry.resources.requests.memory | string | `"256Mi"` |  |
| upstream.registry.registry.resources.requests.cpu | string | `"100m"` |  |
| upstream.registry.registry.resources.limits.cpu | string | `"100m"` |  |
| upstream.registry.registry.resources.limits.memory | string | `"256Mi"` |  |
| upstream.registry.registry.extraEnvVars | list | `[]` |  |
| upstream.registry.controller.image.repository | string | `"registry1.dso.mil/ironbank/opensource/goharbor/harbor-registryctl"` |  |
| upstream.registry.controller.image.tag | string | `"v2.13.1"` |  |
| upstream.registry.controller.image.pullSecrets[0] | string | `"private-registry"` |  |
| upstream.registry.controller.resources.requests.memory | string | `"256Mi"` |  |
| upstream.registry.controller.resources.requests.cpu | string | `"100m"` |  |
| upstream.registry.controller.resources.limits.cpu | string | `"100m"` |  |
| upstream.registry.controller.resources.limits.memory | string | `"256Mi"` |  |
| upstream.registry.controller.extraEnvVars | list | `[]` |  |
| upstream.registry.serviceAccount.create | bool | `false` |  |
| upstream.registry.serviceAccount.annotations | object | `{}` |  |
| upstream.registry.serviceAccount.imagePullSecrets | list | `[]` |  |
| upstream.registry.serviceAccountName | string | `""` |  |
| upstream.registry.automountServiceAccountToken | bool | `false` |  |
| upstream.registry.replicas | int | `1` |  |
| upstream.registry.revisionHistoryLimit | int | `10` |  |
| upstream.registry.nodeSelector | object | `{}` |  |
| upstream.registry.tolerations | list | `[]` |  |
| upstream.registry.affinity | object | `{}` |  |
| upstream.registry.topologySpreadConstraints | list | `[]` |  |
| upstream.registry.podAnnotations | object | `{}` |  |
| upstream.registry.podLabels | object | `{}` |  |
| upstream.registry.priorityClassName | string | `nil` |  |
| upstream.registry.initContainers | list | `[]` |  |
| upstream.registry.secret | string | `""` |  |
| upstream.registry.existingSecret | string | `""` |  |
| upstream.registry.existingSecretKey | string | `"REGISTRY_HTTP_SECRET"` |  |
| upstream.registry.relativeurls | bool | `false` |  |
| upstream.registry.credentials.username | string | `"harbor_registry_user"` |  |
| upstream.registry.credentials.password | string | `"harbor_registry_password"` |  |
| upstream.registry.credentials.existingSecret | string | `""` |  |
| upstream.registry.credentials.htpasswdString | string | `""` |  |
| upstream.registry.middleware.enabled | bool | `false` |  |
| upstream.registry.middleware.type | string | `"cloudFront"` |  |
| upstream.registry.middleware.cloudFront.baseurl | string | `"example.cloudfront.net"` |  |
| upstream.registry.middleware.cloudFront.keypairid | string | `"KEYPAIRID"` |  |
| upstream.registry.middleware.cloudFront.duration | string | `"3000s"` |  |
| upstream.registry.middleware.cloudFront.ipfilteredby | string | `"none"` |  |
| upstream.registry.middleware.cloudFront.privateKeySecret | string | `"my-secret"` |  |
| upstream.registry.upload_purging.enabled | bool | `true` |  |
| upstream.registry.upload_purging.age | string | `"168h"` |  |
| upstream.registry.upload_purging.interval | string | `"24h"` |  |
| upstream.registry.upload_purging.dryrun | bool | `false` |  |
| upstream.trivy.enabled | bool | `true` |  |
| upstream.trivy.image.repository | string | `"registry1.dso.mil/ironbank/opensource/goharbor/trivy-adapter"` |  |
| upstream.trivy.image.tag | string | `"v2.13.1"` |  |
| upstream.trivy.image.pullSecrets[0] | string | `"private-registry"` |  |
| upstream.trivy.serviceAccountName | string | `""` |  |
| upstream.trivy.automountServiceAccountToken | bool | `false` |  |
| upstream.trivy.replicas | int | `1` |  |
| upstream.trivy.resources.requests.cpu | string | `"200m"` |  |
| upstream.trivy.resources.requests.memory | string | `"512Mi"` |  |
| upstream.trivy.resources.limits.cpu | int | `1` |  |
| upstream.trivy.resources.limits.memory | string | `"1Gi"` |  |
| upstream.trivy.extraEnvVars | list | `[]` |  |
| upstream.trivy.nodeSelector | object | `{}` |  |
| upstream.trivy.tolerations | list | `[]` |  |
| upstream.trivy.affinity | object | `{}` |  |
| upstream.trivy.topologySpreadConstraints | list | `[]` |  |
| upstream.trivy.podAnnotations | object | `{}` |  |
| upstream.trivy.podLabels | object | `{}` |  |
| upstream.trivy.priorityClassName | string | `nil` |  |
| upstream.trivy.initContainers | list | `[]` |  |
| upstream.trivy.debugMode | bool | `false` |  |
| upstream.trivy.vulnType | string | `"os,library"` |  |
| upstream.trivy.severity | string | `"UNKNOWN,LOW,MEDIUM,HIGH,CRITICAL"` |  |
| upstream.trivy.ignoreUnfixed | bool | `false` |  |
| upstream.trivy.insecure | bool | `false` |  |
| upstream.trivy.gitHubToken | string | `""` |  |
| upstream.trivy.skipUpdate | bool | `false` |  |
| upstream.trivy.skipJavaDBUpdate | bool | `false` |  |
| upstream.trivy.offlineScan | bool | `false` |  |
| upstream.trivy.securityCheck | string | `"vuln"` |  |
| upstream.trivy.timeout | string | `"5m0s"` |  |
| upstream.database.maxIdleConns | string | `"100"` |  |
| upstream.database.maxOpenConns | string | `"1000"` |  |
| upstream.database.type | string | `"external"` |  |
| upstream.database.internal.image.repository | string | `"goharbor/harbor-db"` |  |
| upstream.database.internal.image.tag | string | `"v2.13.1"` |  |
| upstream.database.internal.serviceAccountName | string | `""` |  |
| upstream.database.internal.automountServiceAccountToken | bool | `false` |  |
| upstream.database.internal.password | string | `"changeit"` |  |
| upstream.database.internal.shmSizeLimit | string | `"512Mi"` |  |
| upstream.database.internal.resources.requests.memory | string | `"256Mi"` |  |
| upstream.database.internal.resources.requests.cpu | string | `"100m"` |  |
| upstream.database.internal.resources.limits.cpu | string | `"100m"` |  |
| upstream.database.internal.resources.limits.memory | string | `"256Mi"` |  |
| upstream.database.internal.extraEnvVars | list | `[]` |  |
| upstream.database.internal.nodeSelector | object | `{}` |  |
| upstream.database.internal.tolerations | list | `[]` |  |
| upstream.database.internal.affinity | object | `{}` |  |
| upstream.database.internal.priorityClassName | string | `nil` |  |
| upstream.database.internal.extrInitContainers | list | `[]` |  |
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
| upstream.database.external.existingSecret | string | `""` |  |
| upstream.database.external.sslmode | string | `"disable"` |  |
| upstream.redis.type | string | `"external"` |  |
| upstream.redis.internal.image.repository | string | `"goharbor/redis-photon"` |  |
| upstream.redis.internal.image.tag | string | `"v2.13.1"` |  |
| upstream.redis.internal.image.pullSecrets[0] | string | `"private-registry"` |  |
| upstream.redis.internal.serviceAccountName | string | `""` |  |
| upstream.redis.internal.automountServiceAccountToken | bool | `false` |  |
| upstream.redis.internal.resources.requests.memory | string | `"256Mi"` |  |
| upstream.redis.internal.resources.requests.cpu | string | `"100m"` |  |
| upstream.redis.internal.resources.limits.memory | string | `"256Mi"` |  |
| upstream.redis.internal.resources.limits.cpu | string | `"100m"` |  |
| upstream.redis.internal.nodeSelector | object | `{}` |  |
| upstream.redis.internal.tolerations | list | `[]` |  |
| upstream.redis.internal.affinity | object | `{}` |  |
| upstream.redis.internal.priorityClassName | string | `nil` |  |
| upstream.redis.internal.initContainers | list | `[]` |  |
| upstream.redis.internal.jobserviceDatabaseIndex | string | `"1"` |  |
| upstream.redis.internal.registryDatabaseIndex | string | `"2"` |  |
| upstream.redis.internal.trivyAdapterIndex | string | `"5"` |  |
| upstream.redis.external.addr | string | `"harbor-redis-bb-master:6379"` |  |
| upstream.redis.external.sentinelMasterSet | string | `""` |  |
| upstream.redis.external.tlsOptions.enable | bool | `false` |  |
| upstream.redis.external.coreDatabaseIndex | string | `"0"` |  |
| upstream.redis.external.jobserviceDatabaseIndex | string | `"1"` |  |
| upstream.redis.external.registryDatabaseIndex | string | `"2"` |  |
| upstream.redis.external.trivyAdapterIndex | string | `"5"` |  |
| upstream.redis.external.username | string | `""` |  |
| upstream.redis.external.password | string | `""` |  |
| upstream.redis.external.existingSecret | string | `""` |  |
| upstream.redis.podAnnotations | object | `{}` |  |
| upstream.exporter.image.repository | string | `"registry1.dso.mil/ironbank/opensource/goharbor/harbor-exporter"` |  |
| upstream.exporter.image.tag | string | `"v2.13.1"` |  |
| upstream.exporter.image.pullSecrets[0] | string | `"private-registry"` |  |
| upstream.exporter.serviceAccountName | string | `""` |  |
| upstream.exporter.automountServiceAccountToken | bool | `false` |  |
| upstream.exporter.replicas | int | `1` |  |
| upstream.exporter.revisionHistoryLimit | int | `10` |  |
| upstream.exporter.resources.requests.memory | string | `"256Mi"` |  |
| upstream.exporter.resources.requests.cpu | string | `"100m"` |  |
| upstream.exporter.resources.limits.cpu | string | `"100m"` |  |
| upstream.exporter.resources.limits.memory | string | `"256Mi"` |  |
| upstream.exporter.extraEnvVars | list | `[]` |  |
| upstream.exporter.podAnnotations | object | `{}` |  |
| upstream.exporter.podLabels | object | `{}` |  |
| upstream.exporter.nodeSelector | object | `{}` |  |
| upstream.exporter.tolerations | list | `[]` |  |
| upstream.exporter.affinity | object | `{}` |  |
| upstream.exporter.topologySpreadConstraints | list | `[]` |  |
| upstream.exporter.priorityClassName | string | `nil` |  |
| upstream.exporter.cacheDuration | int | `23` |  |
| upstream.exporter.cacheCleanInterval | int | `14400` |  |
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
| redis-bb.image.tag | string | `"8.0.3"` |  |
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

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.

---

_This file is programatically generated using `helm-docs` and some BigBang-specific templates. The `gluon` repository has [instructions for regenerating package READMEs](https://repo1.dso.mil/big-bang/product/packages/gluon/-/blob/master/docs/bb-package-readme.md)._

