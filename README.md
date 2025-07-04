<!-- Warning: Do not manually edit this file. See notes on gluon + helm-docs at the end of this file for more information. -->
# harbor

![Version: 1.17.1-bb.1](https://img.shields.io/badge/Version-1.17.1--bb.1-informational?style=flat-square) ![AppVersion: 2.13.1](https://img.shields.io/badge/AppVersion-2.13.1-informational?style=flat-square) ![Maintenance Track: bb_integrated](https://img.shields.io/badge/Maintenance_Track-bb_integrated-green?style=flat-square)

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
| expose.type | string | `"ingress"` |  |
| expose.tls.enabled | bool | `true` |  |
| expose.tls.certSource | string | `"auto"` |  |
| expose.tls.auto.commonName | string | `""` |  |
| expose.tls.secret.secretName | string | `""` |  |
| expose.ingress.hosts.core | string | `"core.harbor.domain"` |  |
| expose.ingress.controller | string | `"default"` |  |
| expose.ingress.kubeVersionOverride | string | `""` |  |
| expose.ingress.className | string | `""` |  |
| expose.ingress.annotations."ingress.kubernetes.io/ssl-redirect" | string | `"true"` |  |
| expose.ingress.annotations."ingress.kubernetes.io/proxy-body-size" | string | `"0"` |  |
| expose.ingress.annotations."nginx.ingress.kubernetes.io/ssl-redirect" | string | `"true"` |  |
| expose.ingress.annotations."nginx.ingress.kubernetes.io/proxy-body-size" | string | `"0"` |  |
| expose.ingress.labels | object | `{}` |  |
| expose.clusterIP.name | string | `"harbor"` |  |
| expose.clusterIP.staticClusterIP | string | `""` |  |
| expose.clusterIP.ports.httpPort | int | `80` |  |
| expose.clusterIP.ports.httpsPort | int | `443` |  |
| expose.clusterIP.annotations | object | `{}` |  |
| expose.clusterIP.labels | object | `{}` |  |
| expose.nodePort.name | string | `"harbor"` |  |
| expose.nodePort.ports.http.port | int | `80` |  |
| expose.nodePort.ports.http.nodePort | int | `30002` |  |
| expose.nodePort.ports.https.port | int | `443` |  |
| expose.nodePort.ports.https.nodePort | int | `30003` |  |
| expose.nodePort.annotations | object | `{}` |  |
| expose.nodePort.labels | object | `{}` |  |
| expose.loadBalancer.name | string | `"harbor"` |  |
| expose.loadBalancer.IP | string | `""` |  |
| expose.loadBalancer.ports.httpPort | int | `80` |  |
| expose.loadBalancer.ports.httpsPort | int | `443` |  |
| expose.loadBalancer.annotations | object | `{}` |  |
| expose.loadBalancer.labels | object | `{}` |  |
| expose.loadBalancer.sourceRanges | list | `[]` |  |
| externalURL | string | `"https://core.harbor.domain"` |  |
| persistence.enabled | bool | `true` |  |
| persistence.resourcePolicy | string | `"keep"` |  |
| persistence.persistentVolumeClaim.registry.existingClaim | string | `""` |  |
| persistence.persistentVolumeClaim.registry.storageClass | string | `""` |  |
| persistence.persistentVolumeClaim.registry.subPath | string | `""` |  |
| persistence.persistentVolumeClaim.registry.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.persistentVolumeClaim.registry.size | string | `"5Gi"` |  |
| persistence.persistentVolumeClaim.registry.annotations | object | `{}` |  |
| persistence.persistentVolumeClaim.jobservice.jobLog.existingClaim | string | `""` |  |
| persistence.persistentVolumeClaim.jobservice.jobLog.storageClass | string | `""` |  |
| persistence.persistentVolumeClaim.jobservice.jobLog.subPath | string | `""` |  |
| persistence.persistentVolumeClaim.jobservice.jobLog.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.persistentVolumeClaim.jobservice.jobLog.size | string | `"1Gi"` |  |
| persistence.persistentVolumeClaim.jobservice.jobLog.annotations | object | `{}` |  |
| persistence.persistentVolumeClaim.jobservice.scanDataExports.existingClaim | string | `""` |  |
| persistence.persistentVolumeClaim.jobservice.scanDataExports.storageClass | string | `""` |  |
| persistence.persistentVolumeClaim.jobservice.scanDataExports.subPath | string | `""` |  |
| persistence.persistentVolumeClaim.jobservice.scanDataExports.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.persistentVolumeClaim.jobservice.scanDataExports.size | string | `"1Gi"` |  |
| persistence.persistentVolumeClaim.jobservice.scanDataExports.annotations | object | `{}` |  |
| persistence.persistentVolumeClaim.database.existingClaim | string | `""` |  |
| persistence.persistentVolumeClaim.database.storageClass | string | `""` |  |
| persistence.persistentVolumeClaim.database.subPath | string | `""` |  |
| persistence.persistentVolumeClaim.database.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.persistentVolumeClaim.database.size | string | `"1Gi"` |  |
| persistence.persistentVolumeClaim.database.annotations | object | `{}` |  |
| persistence.persistentVolumeClaim.redis.existingClaim | string | `""` |  |
| persistence.persistentVolumeClaim.redis.storageClass | string | `""` |  |
| persistence.persistentVolumeClaim.redis.subPath | string | `""` |  |
| persistence.persistentVolumeClaim.redis.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.persistentVolumeClaim.redis.size | string | `"1Gi"` |  |
| persistence.persistentVolumeClaim.redis.annotations | object | `{}` |  |
| persistence.persistentVolumeClaim.trivy.existingClaim | string | `""` |  |
| persistence.persistentVolumeClaim.trivy.storageClass | string | `""` |  |
| persistence.persistentVolumeClaim.trivy.subPath | string | `""` |  |
| persistence.persistentVolumeClaim.trivy.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.persistentVolumeClaim.trivy.size | string | `"5Gi"` |  |
| persistence.persistentVolumeClaim.trivy.annotations | object | `{}` |  |
| persistence.imageChartStorage.disableredirect | bool | `false` |  |
| persistence.imageChartStorage.type | string | `"filesystem"` |  |
| persistence.imageChartStorage.filesystem.rootdirectory | string | `"/storage"` |  |
| persistence.imageChartStorage.azure.accountname | string | `"accountname"` |  |
| persistence.imageChartStorage.azure.accountkey | string | `"base64encodedaccountkey"` |  |
| persistence.imageChartStorage.azure.container | string | `"containername"` |  |
| persistence.imageChartStorage.azure.existingSecret | string | `""` |  |
| persistence.imageChartStorage.gcs.bucket | string | `"bucketname"` |  |
| persistence.imageChartStorage.gcs.encodedkey | string | `"base64-encoded-json-key-file"` |  |
| persistence.imageChartStorage.gcs.existingSecret | string | `""` |  |
| persistence.imageChartStorage.gcs.useWorkloadIdentity | bool | `false` |  |
| persistence.imageChartStorage.s3.region | string | `"us-west-1"` |  |
| persistence.imageChartStorage.s3.bucket | string | `"bucketname"` |  |
| persistence.imageChartStorage.swift.authurl | string | `"https://storage.myprovider.com/v3/auth"` |  |
| persistence.imageChartStorage.swift.username | string | `"username"` |  |
| persistence.imageChartStorage.swift.password | string | `"password"` |  |
| persistence.imageChartStorage.swift.container | string | `"containername"` |  |
| persistence.imageChartStorage.swift.existingSecret | string | `""` |  |
| persistence.imageChartStorage.oss.accesskeyid | string | `"accesskeyid"` |  |
| persistence.imageChartStorage.oss.accesskeysecret | string | `"accesskeysecret"` |  |
| persistence.imageChartStorage.oss.region | string | `"regionname"` |  |
| persistence.imageChartStorage.oss.bucket | string | `"bucketname"` |  |
| persistence.imageChartStorage.oss.existingSecret | string | `""` |  |
| existingSecretAdminPasswordKey | string | `"HARBOR_ADMIN_PASSWORD"` |  |
| harborAdminPassword | string | `"Harbor12345"` |  |
| internalTLS.enabled | bool | `false` |  |
| internalTLS.strong_ssl_ciphers | bool | `false` |  |
| internalTLS.certSource | string | `"auto"` |  |
| internalTLS.trustCa | string | `""` |  |
| internalTLS.core.secretName | string | `""` |  |
| internalTLS.core.crt | string | `""` |  |
| internalTLS.core.key | string | `""` |  |
| internalTLS.jobservice.secretName | string | `""` |  |
| internalTLS.jobservice.crt | string | `""` |  |
| internalTLS.jobservice.key | string | `""` |  |
| internalTLS.registry.secretName | string | `""` |  |
| internalTLS.registry.crt | string | `""` |  |
| internalTLS.registry.key | string | `""` |  |
| internalTLS.portal.secretName | string | `""` |  |
| internalTLS.portal.crt | string | `""` |  |
| internalTLS.portal.key | string | `""` |  |
| internalTLS.trivy.secretName | string | `""` |  |
| internalTLS.trivy.crt | string | `""` |  |
| internalTLS.trivy.key | string | `""` |  |
| ipFamily.ipv6.enabled | bool | `true` |  |
| ipFamily.ipv4.enabled | bool | `true` |  |
| imagePullPolicy | string | `"IfNotPresent"` |  |
| imagePullSecrets[0].name | string | `"private-registry"` |  |
| updateStrategy.type | string | `"RollingUpdate"` |  |
| logLevel | string | `"info"` |  |
| caSecretName | string | `""` |  |
| secretKey | string | `"not-a-secure-key"` |  |
| existingSecretSecretKey | string | `""` |  |
| proxy.httpProxy | string | `nil` |  |
| proxy.httpsProxy | string | `nil` |  |
| proxy.noProxy | string | `"127.0.0.1,localhost,.local,.internal"` |  |
| proxy.components[0] | string | `"core"` |  |
| proxy.components[1] | string | `"jobservice"` |  |
| proxy.components[2] | string | `"trivy"` |  |
| enableMigrateHelmHook | bool | `false` |  |
| metrics.enabled | bool | `false` |  |
| metrics.core.path | string | `"/metrics"` |  |
| metrics.core.port | int | `8001` |  |
| metrics.registry.path | string | `"/metrics"` |  |
| metrics.registry.port | int | `8001` |  |
| metrics.jobservice.path | string | `"/metrics"` |  |
| metrics.jobservice.port | int | `8001` |  |
| metrics.exporter.path | string | `"/metrics"` |  |
| metrics.exporter.port | int | `8001` |  |
| metrics.serviceMonitor.enabled | bool | `false` |  |
| metrics.serviceMonitor.additionalLabels | object | `{}` |  |
| metrics.serviceMonitor.interval | string | `""` |  |
| metrics.serviceMonitor.metricRelabelings | list | `[]` |  |
| metrics.serviceMonitor.relabelings | list | `[]` |  |
| trace.enabled | bool | `false` |  |
| trace.provider | string | `"jaeger"` |  |
| trace.sample_rate | int | `1` |  |
| trace.jaeger.endpoint | string | `"http://hostname:14268/api/traces"` |  |
| trace.otel.endpoint | string | `"hostname:4318"` |  |
| trace.otel.url_path | string | `"/v1/traces"` |  |
| trace.otel.compression | bool | `false` |  |
| trace.otel.insecure | bool | `true` |  |
| trace.otel.timeout | int | `10` |  |
| cache.enabled | bool | `false` |  |
| cache.expireHours | int | `24` |  |
| containerSecurityContext.runAsGroup | int | `1000` |  |
| containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| nginx.image.repository | string | `"registry1.dso.mil/ironbank/opensource/nginx/nginx"` |  |
| nginx.image.tag | string | `"1.28.0"` |  |
| nginx.image.pullSecrets[0] | string | `"private-registry"` |  |
| nginx.serviceAccountName | string | `""` |  |
| nginx.automountServiceAccountToken | bool | `false` |  |
| nginx.replicas | int | `1` |  |
| nginx.revisionHistoryLimit | int | `10` |  |
| nginx.resources.requests.memory | string | `"256Mi"` |  |
| nginx.resources.requests.cpu | string | `"100m"` |  |
| nginx.resources.limits.cpu | string | `"100m"` |  |
| nginx.resources.limits.memory | string | `"256Mi"` |  |
| nginx.extraEnvVars | list | `[]` |  |
| nginx.nodeSelector | object | `{}` |  |
| nginx.tolerations | list | `[]` |  |
| nginx.affinity | object | `{}` |  |
| nginx.topologySpreadConstraints | list | `[]` |  |
| nginx.podAnnotations | object | `{}` |  |
| nginx.podLabels | object | `{}` |  |
| nginx.priorityClassName | string | `nil` |  |
| portal.image.repository | string | `"registry1.dso.mil/ironbank/opensource/goharbor/harbor-portal"` |  |
| portal.image.tag | string | `"v2.13.1"` |  |
| portal.image.pullSecrets[0] | string | `"private-registry"` |  |
| portal.serviceAccountName | string | `""` |  |
| portal.automountServiceAccountToken | bool | `false` |  |
| portal.replicas | int | `1` |  |
| portal.revisionHistoryLimit | int | `10` |  |
| portal.resources.requests.memory | string | `"256Mi"` |  |
| portal.resources.requests.cpu | string | `"100m"` |  |
| portal.resources.limits.cpu | string | `"100m"` |  |
| portal.resources.limits.memory | string | `"256Mi"` |  |
| portal.extraEnvVars | list | `[]` |  |
| portal.nodeSelector | object | `{}` |  |
| portal.tolerations | list | `[]` |  |
| portal.affinity | object | `{}` |  |
| portal.topologySpreadConstraints | list | `[]` |  |
| portal.podAnnotations | object | `{}` |  |
| portal.podLabels | object | `{}` |  |
| portal.serviceAnnotations | object | `{}` |  |
| portal.priorityClassName | string | `nil` |  |
| portal.initContainers | list | `[]` |  |
| core.image.repository | string | `"registry1.dso.mil/ironbank/opensource/goharbor/harbor-core"` |  |
| core.image.tag | string | `"v2.13.1"` |  |
| core.image.pullSecrets[0] | string | `"private-registry"` |  |
| core.serviceAccountName | string | `""` |  |
| core.automountServiceAccountToken | bool | `false` |  |
| core.replicas | int | `1` |  |
| core.revisionHistoryLimit | int | `10` |  |
| core.startupProbe.enabled | bool | `true` |  |
| core.startupProbe.initialDelaySeconds | int | `30` |  |
| core.resources.requests.memory | string | `"256Mi"` |  |
| core.resources.requests.cpu | string | `"100m"` |  |
| core.resources.limits.cpu | string | `"100m"` |  |
| core.resources.limits.memory | string | `"256Mi"` |  |
| core.extraEnvVars | list | `[]` |  |
| core.nodeSelector | object | `{}` |  |
| core.tolerations | list | `[]` |  |
| core.affinity | object | `{}` |  |
| core.topologySpreadConstraints | list | `[]` |  |
| core.podAnnotations | object | `{}` |  |
| core.podLabels | object | `{}` |  |
| core.serviceAnnotations | object | `{}` |  |
| core.priorityClassName | string | `nil` |  |
| core.initContainers | list | `[]` |  |
| core.configureUserSettings | string | `nil` |  |
| core.quotaUpdateProvider | string | `"db"` |  |
| core.secret | string | `""` |  |
| core.existingSecret | string | `""` |  |
| core.secretName | string | `""` |  |
| core.tokenKey | string | `nil` |  |
| core.tokenCert | string | `nil` |  |
| core.xsrfKey | string | `""` |  |
| core.existingXsrfSecret | string | `""` |  |
| core.existingXsrfSecretKey | string | `"CSRF_KEY"` |  |
| core.artifactPullAsyncFlushDuration | string | `nil` |  |
| core.gdpr.deleteUser | bool | `false` |  |
| core.gdpr.auditLogsCompliant | bool | `false` |  |
| jobservice.image.repository | string | `"registry1.dso.mil/ironbank/opensource/goharbor/harbor-jobservice"` |  |
| jobservice.image.tag | string | `"v2.13.1"` |  |
| jobservice.image.pullSecrets[0] | string | `"private-registry"` |  |
| jobservice.serviceAccountName | string | `""` |  |
| jobservice.automountServiceAccountToken | bool | `false` |  |
| jobservice.replicas | int | `1` |  |
| jobservice.revisionHistoryLimit | int | `10` |  |
| jobservice.resources.requests.memory | string | `"256Mi"` |  |
| jobservice.resources.requests.cpu | string | `"100m"` |  |
| jobservice.resources.limits.cpu | string | `"100m"` |  |
| jobservice.resources.limits.memory | string | `"256Mi"` |  |
| jobservice.extraEnvVars | list | `[]` |  |
| jobservice.nodeSelector | object | `{}` |  |
| jobservice.tolerations | list | `[]` |  |
| jobservice.affinity | object | `{}` |  |
| jobservice.topologySpreadConstraints | string | `nil` |  |
| jobservice.podAnnotations | object | `{}` |  |
| jobservice.podLabels | object | `{}` |  |
| jobservice.priorityClassName | string | `nil` |  |
| jobservice.initContainers | list | `[]` |  |
| jobservice.maxJobWorkers | int | `10` |  |
| jobservice.jobLoggers[0] | string | `"file"` |  |
| jobservice.loggerSweeperDuration | int | `14` |  |
| jobservice.notification.webhook_job_max_retry | int | `3` |  |
| jobservice.notification.webhook_job_http_client_timeout | int | `3` |  |
| jobservice.reaper.max_update_hours | int | `24` |  |
| jobservice.reaper.max_dangling_hours | int | `168` |  |
| jobservice.secret | string | `""` |  |
| jobservice.existingSecret | string | `""` |  |
| jobservice.existingSecretKey | string | `"JOBSERVICE_SECRET"` |  |
| registry.registry.image.repository | string | `"registry1.dso.mil/ironbank/opensource/goharbor/registry"` |  |
| registry.registry.image.tag | string | `"v2.13.1"` |  |
| registry.registry.image.pullSecrets[0] | string | `"private-registry"` |  |
| registry.registry.resources.requests.memory | string | `"256Mi"` |  |
| registry.registry.resources.requests.cpu | string | `"100m"` |  |
| registry.registry.resources.limits.cpu | string | `"100m"` |  |
| registry.registry.resources.limits.memory | string | `"256Mi"` |  |
| registry.registry.extraEnvVars | list | `[]` |  |
| registry.controller.image.repository | string | `"registry1.dso.mil/ironbank/opensource/goharbor/harbor-registryctl"` |  |
| registry.controller.image.tag | string | `"v2.13.1"` |  |
| registry.controller.image.pullSecrets[0] | string | `"private-registry"` |  |
| registry.controller.resources.requests.memory | string | `"256Mi"` |  |
| registry.controller.resources.requests.cpu | string | `"100m"` |  |
| registry.controller.resources.limits.cpu | string | `"100m"` |  |
| registry.controller.resources.limits.memory | string | `"256Mi"` |  |
| registry.controller.extraEnvVars | list | `[]` |  |
| registry.serviceAccount.create | bool | `false` |  |
| registry.serviceAccount.annotations | object | `{}` |  |
| registry.serviceAccount.imagePullSecrets | list | `[]` |  |
| registry.serviceAccountName | string | `""` |  |
| registry.automountServiceAccountToken | bool | `false` |  |
| registry.replicas | int | `1` |  |
| registry.revisionHistoryLimit | int | `10` |  |
| registry.nodeSelector | object | `{}` |  |
| registry.tolerations | list | `[]` |  |
| registry.affinity | object | `{}` |  |
| registry.topologySpreadConstraints | list | `[]` |  |
| registry.podAnnotations | object | `{}` |  |
| registry.podLabels | object | `{}` |  |
| registry.priorityClassName | string | `nil` |  |
| registry.initContainers | list | `[]` |  |
| registry.secret | string | `""` |  |
| registry.existingSecret | string | `""` |  |
| registry.existingSecretKey | string | `"REGISTRY_HTTP_SECRET"` |  |
| registry.relativeurls | bool | `false` |  |
| registry.credentials.username | string | `"harbor_registry_user"` |  |
| registry.credentials.password | string | `"harbor_registry_password"` |  |
| registry.credentials.existingSecret | string | `""` |  |
| registry.credentials.htpasswdString | string | `""` |  |
| registry.middleware.enabled | bool | `false` |  |
| registry.middleware.type | string | `"cloudFront"` |  |
| registry.middleware.cloudFront.baseurl | string | `"example.cloudfront.net"` |  |
| registry.middleware.cloudFront.keypairid | string | `"KEYPAIRID"` |  |
| registry.middleware.cloudFront.duration | string | `"3000s"` |  |
| registry.middleware.cloudFront.ipfilteredby | string | `"none"` |  |
| registry.middleware.cloudFront.privateKeySecret | string | `"my-secret"` |  |
| registry.upload_purging.enabled | bool | `true` |  |
| registry.upload_purging.age | string | `"168h"` |  |
| registry.upload_purging.interval | string | `"24h"` |  |
| registry.upload_purging.dryrun | bool | `false` |  |
| trivy.enabled | bool | `true` |  |
| trivy.image.repository | string | `"registry1.dso.mil/ironbank/opensource/goharbor/trivy-adapter"` |  |
| trivy.image.tag | string | `"v2.13.1"` |  |
| trivy.image.pullSecrets[0] | string | `"private-registry"` |  |
| trivy.serviceAccountName | string | `""` |  |
| trivy.automountServiceAccountToken | bool | `false` |  |
| trivy.replicas | int | `1` |  |
| trivy.resources.requests.cpu | string | `"200m"` |  |
| trivy.resources.requests.memory | string | `"512Mi"` |  |
| trivy.resources.limits.cpu | int | `1` |  |
| trivy.resources.limits.memory | string | `"1Gi"` |  |
| trivy.extraEnvVars | list | `[]` |  |
| trivy.nodeSelector | object | `{}` |  |
| trivy.tolerations | list | `[]` |  |
| trivy.affinity | object | `{}` |  |
| trivy.topologySpreadConstraints | list | `[]` |  |
| trivy.podAnnotations | object | `{}` |  |
| trivy.podLabels | object | `{}` |  |
| trivy.priorityClassName | string | `nil` |  |
| trivy.initContainers | list | `[]` |  |
| trivy.debugMode | bool | `false` |  |
| trivy.vulnType | string | `"os,library"` |  |
| trivy.severity | string | `"UNKNOWN,LOW,MEDIUM,HIGH,CRITICAL"` |  |
| trivy.ignoreUnfixed | bool | `false` |  |
| trivy.insecure | bool | `false` |  |
| trivy.gitHubToken | string | `""` |  |
| trivy.skipUpdate | bool | `false` |  |
| trivy.skipJavaDBUpdate | bool | `false` |  |
| trivy.offlineScan | bool | `false` |  |
| trivy.securityCheck | string | `"vuln"` |  |
| trivy.timeout | string | `"5m0s"` |  |
| database.maxIdleConns | string | `"100"` |  |
| database.maxOpenConns | string | `"1000"` |  |
| database.type | string | `"external"` |  |
| database.internal.image.repository | string | `"goharbor/harbor-db"` |  |
| database.internal.image.tag | string | `"v2.13.1"` |  |
| database.internal.serviceAccountName | string | `""` |  |
| database.internal.automountServiceAccountToken | bool | `false` |  |
| database.internal.password | string | `"changeit"` |  |
| database.internal.shmSizeLimit | string | `"512Mi"` |  |
| database.internal.resources.requests.memory | string | `"256Mi"` |  |
| database.internal.resources.requests.cpu | string | `"100m"` |  |
| database.internal.resources.limits.cpu | string | `"100m"` |  |
| database.internal.resources.limits.memory | string | `"256Mi"` |  |
| database.internal.extraEnvVars | list | `[]` |  |
| database.internal.nodeSelector | object | `{}` |  |
| database.internal.tolerations | list | `[]` |  |
| database.internal.affinity | object | `{}` |  |
| database.internal.priorityClassName | string | `nil` |  |
| database.internal.extrInitContainers | list | `[]` |  |
| database.internal.initContainer.migrator | object | `{}` |  |
| database.internal.initContainer.resources.requests.memory | string | `"128Mi"` |  |
| database.internal.initContainer.resources.requests.cpu | string | `"100m"` |  |
| database.internal.initContainer.resources.limits.cpu | string | `"100m"` |  |
| database.internal.initContainer.resources.limits.memory | string | `"128Mi"` |  |
| database.internal.initContainer.permissions | object | `{}` |  |
| database.external.host | string | `"harbor-postgresql"` |  |
| database.external.port | string | `"5432"` |  |
| database.external.username | string | `"harborUser"` |  |
| database.external.password | string | `"harborPW"` |  |
| database.external.coreDatabase | string | `"harborUser"` |  |
| database.external.existingSecret | string | `""` |  |
| database.external.sslmode | string | `"disable"` |  |
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
| redis.type | string | `"external"` |  |
| redis.internal.image.repository | string | `"goharbor/redis-photon"` |  |
| redis.internal.image.tag | string | `"v2.13.1"` |  |
| redis.internal.image.pullSecrets[0] | string | `"private-registry"` |  |
| redis.internal.serviceAccountName | string | `""` |  |
| redis.internal.automountServiceAccountToken | bool | `false` |  |
| redis.internal.resources.requests.memory | string | `"256Mi"` |  |
| redis.internal.resources.requests.cpu | string | `"100m"` |  |
| redis.internal.resources.limits.memory | string | `"256Mi"` |  |
| redis.internal.resources.limits.cpu | string | `"100m"` |  |
| redis.internal.nodeSelector | object | `{}` |  |
| redis.internal.tolerations | list | `[]` |  |
| redis.internal.affinity | object | `{}` |  |
| redis.internal.priorityClassName | string | `nil` |  |
| redis.internal.initContainers | list | `[]` |  |
| redis.internal.jobserviceDatabaseIndex | string | `"1"` |  |
| redis.internal.registryDatabaseIndex | string | `"2"` |  |
| redis.internal.trivyAdapterIndex | string | `"5"` |  |
| redis.external.addr | string | `"harbor-redis-bb-master:6379"` |  |
| redis.external.sentinelMasterSet | string | `""` |  |
| redis.external.tlsOptions.enable | bool | `false` |  |
| redis.external.coreDatabaseIndex | string | `"0"` |  |
| redis.external.jobserviceDatabaseIndex | string | `"1"` |  |
| redis.external.registryDatabaseIndex | string | `"2"` |  |
| redis.external.trivyAdapterIndex | string | `"5"` |  |
| redis.external.username | string | `""` |  |
| redis.external.password | string | `""` |  |
| redis.external.existingSecret | string | `""` |  |
| redis.podAnnotations | object | `{}` |  |
| redis-bb.enabled | bool | `true` | Enable BigBang provided redis sub-chart. Disable if using external cloud elasticache or redis endpoint and fill in `redis.external.addr` in above section |
| redis-bb.auth.enabled | bool | `false` |  |
| redis-bb.istio.redis.enabled | bool | `false` |  |
| redis-bb.image.registry | string | `"registry1.dso.mil"` |  |
| redis-bb.image.repository | string | `"ironbank/bitnami/redis"` |  |
| redis-bb.image.tag | string | `"8.0.2"` |  |
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
| exporter.image.repository | string | `"registry1.dso.mil/ironbank/opensource/goharbor/harbor-exporter"` |  |
| exporter.image.tag | string | `"v2.13.1"` |  |
| exporter.image.pullSecrets[0] | string | `"private-registry"` |  |
| exporter.serviceAccountName | string | `""` |  |
| exporter.automountServiceAccountToken | bool | `false` |  |
| exporter.replicas | int | `1` |  |
| exporter.revisionHistoryLimit | int | `10` |  |
| exporter.resources.requests.memory | string | `"256Mi"` |  |
| exporter.resources.requests.cpu | string | `"100m"` |  |
| exporter.resources.limits.cpu | string | `"100m"` |  |
| exporter.resources.limits.memory | string | `"256Mi"` |  |
| exporter.extraEnvVars | list | `[]` |  |
| exporter.podAnnotations | object | `{}` |  |
| exporter.podLabels | object | `{}` |  |
| exporter.nodeSelector | object | `{}` |  |
| exporter.tolerations | list | `[]` |  |
| exporter.affinity | object | `{}` |  |
| exporter.topologySpreadConstraints | list | `[]` |  |
| exporter.priorityClassName | string | `nil` |  |
| exporter.cacheDuration | int | `23` |  |
| exporter.cacheCleanInterval | int | `14400` |  |
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

