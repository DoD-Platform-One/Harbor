# harbor

![Version: 1.10.1-bb.1](https://img.shields.io/badge/Version-1.10.1--bb.1-informational?style=flat-square) ![AppVersion: v2.6.1](https://img.shields.io/badge/AppVersion-v2.6.1-informational?style=flat-square)

An open source trusted cloud native registry that stores, signs, and scans content

## Upstream References
* <https://goharbor.io>

* <https://github.com/goharbor/harbor>
* <https://github.com/goharbor/harbor-helm>

## Learn More
* [Application Overview](docs/overview.md)
* [Other Documentation](docs/)

## Pre-Requisites

* Kubernetes Cluster deployed
* Kubernetes config installed in `~/.kube/config`
* Helm installed

Install Helm

https://helm.sh/docs/intro/install/

## Deployment

* Clone down the repository
* cd into directory
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
| expose.tls.secret.notarySecretName | string | `""` |  |
| expose.ingress.hosts.core | string | `"core.harbor.domain"` |  |
| expose.ingress.hosts.notary | string | `"notary.harbor.domain"` |  |
| expose.ingress.controller | string | `"default"` |  |
| expose.ingress.kubeVersionOverride | string | `""` |  |
| expose.ingress.className | string | `""` |  |
| expose.ingress.annotations."ingress.kubernetes.io/ssl-redirect" | string | `"true"` |  |
| expose.ingress.annotations."ingress.kubernetes.io/proxy-body-size" | string | `"0"` |  |
| expose.ingress.annotations."nginx.ingress.kubernetes.io/ssl-redirect" | string | `"true"` |  |
| expose.ingress.annotations."nginx.ingress.kubernetes.io/proxy-body-size" | string | `"0"` |  |
| expose.ingress.notary.annotations | object | `{}` |  |
| expose.ingress.notary.labels | object | `{}` |  |
| expose.ingress.harbor.annotations | object | `{}` |  |
| expose.ingress.harbor.labels | object | `{}` |  |
| expose.clusterIP.name | string | `"harbor"` |  |
| expose.clusterIP.annotations | object | `{}` |  |
| expose.clusterIP.ports.httpPort | int | `80` |  |
| expose.clusterIP.ports.httpsPort | int | `443` |  |
| expose.clusterIP.ports.notaryPort | int | `4443` |  |
| expose.nodePort.name | string | `"harbor"` |  |
| expose.nodePort.ports.http.port | int | `80` |  |
| expose.nodePort.ports.http.nodePort | int | `30002` |  |
| expose.nodePort.ports.https.port | int | `443` |  |
| expose.nodePort.ports.https.nodePort | int | `30003` |  |
| expose.nodePort.ports.notary.port | int | `4443` |  |
| expose.nodePort.ports.notary.nodePort | int | `30004` |  |
| expose.loadBalancer.name | string | `"harbor"` |  |
| expose.loadBalancer.IP | string | `""` |  |
| expose.loadBalancer.ports.httpPort | int | `80` |  |
| expose.loadBalancer.ports.httpsPort | int | `443` |  |
| expose.loadBalancer.ports.notaryPort | int | `4443` |  |
| expose.loadBalancer.annotations | object | `{}` |  |
| expose.loadBalancer.sourceRanges | list | `[]` |  |
| externalURL | string | `"https://core.harbor.domain"` |  |
| internalTLS.enabled | bool | `false` |  |
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
| internalTLS.chartmuseum.secretName | string | `""` |  |
| internalTLS.chartmuseum.crt | string | `""` |  |
| internalTLS.chartmuseum.key | string | `""` |  |
| internalTLS.trivy.secretName | string | `""` |  |
| internalTLS.trivy.crt | string | `""` |  |
| internalTLS.trivy.key | string | `""` |  |
| ipFamily.ipv6.enabled | bool | `true` |  |
| ipFamily.ipv4.enabled | bool | `true` |  |
| persistence.enabled | bool | `true` |  |
| persistence.resourcePolicy | string | `"keep"` |  |
| persistence.persistentVolumeClaim.registry.existingClaim | string | `""` |  |
| persistence.persistentVolumeClaim.registry.storageClass | string | `""` |  |
| persistence.persistentVolumeClaim.registry.subPath | string | `""` |  |
| persistence.persistentVolumeClaim.registry.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.persistentVolumeClaim.registry.size | string | `"5Gi"` |  |
| persistence.persistentVolumeClaim.registry.annotations | object | `{}` |  |
| persistence.persistentVolumeClaim.chartmuseum.existingClaim | string | `""` |  |
| persistence.persistentVolumeClaim.chartmuseum.storageClass | string | `""` |  |
| persistence.persistentVolumeClaim.chartmuseum.subPath | string | `""` |  |
| persistence.persistentVolumeClaim.chartmuseum.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.persistentVolumeClaim.chartmuseum.size | string | `"5Gi"` |  |
| persistence.persistentVolumeClaim.chartmuseum.annotations | object | `{}` |  |
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
| persistence.imageChartStorage.oss.accesskeyid | string | `"accesskeyid"` |  |
| persistence.imageChartStorage.oss.accesskeysecret | string | `"accesskeysecret"` |  |
| persistence.imageChartStorage.oss.region | string | `"regionname"` |  |
| persistence.imageChartStorage.oss.bucket | string | `"bucketname"` |  |
| imagePullPolicy | string | `"IfNotPresent"` |  |
| imagePullSecrets[0].name | string | `"private-registry"` |  |
| updateStrategy.type | string | `"RollingUpdate"` |  |
| logLevel | string | `"info"` |  |
| harborAdminPassword | string | `"Harbor12345"` |  |
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
| nginx.image.repository | string | `"registry1.dso.mil/ironbank/opensource/nginx/nginx"` |  |
| nginx.image.tag | string | `"1.23.1"` |  |
| nginx.image.pullSecrets[0] | string | `"private-registry"` |  |
| nginx.serviceAccountName | string | `""` |  |
| nginx.automountServiceAccountToken | bool | `false` |  |
| nginx.replicas | int | `1` |  |
| nginx.revisionHistoryLimit | int | `10` |  |
| nginx.nodeSelector | object | `{}` |  |
| nginx.tolerations | list | `[]` |  |
| nginx.affinity | object | `{}` |  |
| nginx.podAnnotations | object | `{}` |  |
| nginx.priorityClassName | string | `nil` |  |
| portal.image.repository | string | `"registry1.dso.mil/ironbank/opensource/goharbor/harbor-portal"` |  |
| portal.image.tag | string | `"v2.6.1"` |  |
| portal.image.pullSecrets[0] | string | `"private-registry"` |  |
| portal.serviceAccountName | string | `""` |  |
| portal.automountServiceAccountToken | bool | `false` |  |
| portal.replicas | int | `1` |  |
| portal.revisionHistoryLimit | int | `10` |  |
| portal.nodeSelector | object | `{}` |  |
| portal.tolerations | list | `[]` |  |
| portal.affinity | object | `{}` |  |
| portal.podAnnotations | object | `{}` |  |
| portal.priorityClassName | string | `nil` |  |
| core.image.repository | string | `"registry1.dso.mil/ironbank/opensource/goharbor/harbor-core"` |  |
| core.image.tag | string | `"v2.6.1"` |  |
| core.image.pullSecrets[0] | string | `"private-registry"` |  |
| core.serviceAccountName | string | `""` |  |
| core.automountServiceAccountToken | bool | `false` |  |
| core.replicas | int | `1` |  |
| core.revisionHistoryLimit | int | `10` |  |
| core.startupProbe.enabled | bool | `true` |  |
| core.startupProbe.initialDelaySeconds | int | `10` |  |
| core.nodeSelector | object | `{}` |  |
| core.tolerations | list | `[]` |  |
| core.affinity | object | `{}` |  |
| core.podAnnotations | object | `{}` |  |
| core.secret | string | `""` |  |
| core.secretName | string | `""` |  |
| core.xsrfKey | string | `""` |  |
| core.priorityClassName | string | `nil` |  |
| core.artifactPullAsyncFlushDuration | string | `nil` |  |
| core.gdpr.deleteUser | bool | `false` |  |
| jobservice.image.repository | string | `"registry1.dso.mil/ironbank/opensource/goharbor/harbor-jobservice"` |  |
| jobservice.image.tag | string | `"v2.6.1"` |  |
| jobservice.image.pullSecrets[0] | string | `"private-registry"` |  |
| jobservice.replicas | int | `1` |  |
| jobservice.revisionHistoryLimit | int | `10` |  |
| jobservice.serviceAccountName | string | `""` |  |
| jobservice.automountServiceAccountToken | bool | `false` |  |
| jobservice.maxJobWorkers | int | `10` |  |
| jobservice.jobLoggers[0] | string | `"file"` |  |
| jobservice.loggerSweeperDuration | int | `14` |  |
| jobservice.nodeSelector | object | `{}` |  |
| jobservice.tolerations | list | `[]` |  |
| jobservice.affinity | object | `{}` |  |
| jobservice.podAnnotations | object | `{}` |  |
| jobservice.secret | string | `""` |  |
| jobservice.priorityClassName | string | `nil` |  |
| registry.serviceAccountName | string | `""` |  |
| registry.automountServiceAccountToken | bool | `false` |  |
| registry.registry.image.repository | string | `"registry1.dso.mil/ironbank/opensource/goharbor/registry"` |  |
| registry.registry.image.tag | string | `"v2.6.1"` |  |
| registry.registry.image.pullSecrets[0] | string | `"private-registry"` |  |
| registry.controller.image.repository | string | `"registry1.dso.mil/ironbank/opensource/goharbor/harbor-registryctl"` |  |
| registry.controller.image.tag | string | `"v2.6.1"` |  |
| registry.controller.image.pullSecrets[0] | string | `"private-registry"` |  |
| registry.replicas | int | `1` |  |
| registry.revisionHistoryLimit | int | `10` |  |
| registry.nodeSelector | object | `{}` |  |
| registry.tolerations | list | `[]` |  |
| registry.affinity | object | `{}` |  |
| registry.podAnnotations | object | `{}` |  |
| registry.priorityClassName | string | `nil` |  |
| registry.secret | string | `""` |  |
| registry.relativeurls | bool | `false` |  |
| registry.credentials.username | string | `"harbor_registry_user"` |  |
| registry.credentials.password | string | `"harbor_registry_password"` |  |
| registry.credentials.existingSecret | string | `""` |  |
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
| chartmuseum.enabled | bool | `true` |  |
| chartmuseum.serviceAccountName | string | `""` |  |
| chartmuseum.automountServiceAccountToken | bool | `false` |  |
| chartmuseum.absoluteUrl | bool | `false` |  |
| chartmuseum.image.repository | string | `"registry1.dso.mil/ironbank/opensource/goharbor/chartmuseum"` |  |
| chartmuseum.image.tag | string | `"v2.6.1"` |  |
| chartmuseum.image.pullSecrets[0] | string | `"private-registry"` |  |
| chartmuseum.replicas | int | `1` |  |
| chartmuseum.revisionHistoryLimit | int | `10` |  |
| chartmuseum.nodeSelector | object | `{}` |  |
| chartmuseum.tolerations | list | `[]` |  |
| chartmuseum.affinity | object | `{}` |  |
| chartmuseum.podAnnotations | object | `{}` |  |
| chartmuseum.priorityClassName | string | `nil` |  |
| chartmuseum.indexLimit | int | `0` |  |
| trivy.enabled | bool | `true` |  |
| trivy.image.repository | string | `"registry1.dso.mil/ironbank/opensource/goharbor/trivy-adapter"` |  |
| trivy.image.tag | string | `"v2.6.0"` |  |
| trivy.image.pullSecrets[0] | string | `"private-registry"` |  |
| trivy.serviceAccountName | string | `""` |  |
| trivy.automountServiceAccountToken | bool | `false` |  |
| trivy.replicas | int | `1` |  |
| trivy.debugMode | bool | `false` |  |
| trivy.vulnType | string | `"os,library"` |  |
| trivy.severity | string | `"UNKNOWN,LOW,MEDIUM,HIGH,CRITICAL"` |  |
| trivy.ignoreUnfixed | bool | `false` |  |
| trivy.insecure | bool | `false` |  |
| trivy.gitHubToken | string | `""` |  |
| trivy.skipUpdate | bool | `false` |  |
| trivy.offlineScan | bool | `false` |  |
| trivy.timeout | string | `"5m0s"` |  |
| trivy.resources.requests.cpu | string | `"200m"` |  |
| trivy.resources.requests.memory | string | `"512Mi"` |  |
| trivy.resources.limits.cpu | int | `1` |  |
| trivy.resources.limits.memory | string | `"1Gi"` |  |
| trivy.nodeSelector | object | `{}` |  |
| trivy.tolerations | list | `[]` |  |
| trivy.affinity | object | `{}` |  |
| trivy.podAnnotations | object | `{}` |  |
| trivy.priorityClassName | string | `nil` |  |
| notary.enabled | bool | `true` |  |
| notary.server.serviceAccountName | string | `""` |  |
| notary.server.automountServiceAccountToken | bool | `false` |  |
| notary.server.image.repository | string | `"registry1.dso.mil/ironbank/opensource/goharbor/notary-server"` |  |
| notary.server.image.tag | string | `"v2.6.1"` |  |
| notary.server.image.pullSecrets[0] | string | `"private-registry"` |  |
| notary.server.replicas | int | `1` |  |
| notary.server.nodeSelector | object | `{}` |  |
| notary.server.tolerations | list | `[]` |  |
| notary.server.affinity | object | `{}` |  |
| notary.server.podAnnotations | object | `{}` |  |
| notary.server.priorityClassName | string | `nil` |  |
| notary.signer.serviceAccountName | string | `""` |  |
| notary.signer.automountServiceAccountToken | bool | `false` |  |
| notary.signer.image.repository | string | `"registry1.dso.mil/ironbank/opensource/goharbor/notary-signer"` |  |
| notary.signer.image.tag | string | `"v2.6.1"` |  |
| notary.signer.image.pullSecrets[0] | string | `"private-registry"` |  |
| notary.signer.replicas | int | `1` |  |
| notary.signer.nodeSelector | object | `{}` |  |
| notary.signer.tolerations | list | `[]` |  |
| notary.signer.affinity | object | `{}` |  |
| notary.signer.podAnnotations | object | `{}` |  |
| notary.signer.priorityClassName | string | `nil` |  |
| notary.secretName | string | `""` |  |
| database.type | string | `"internal"` |  |
| database.internal.serviceAccountName | string | `""` |  |
| database.internal.automountServiceAccountToken | bool | `false` |  |
| database.internal.image.repository | string | `"goharbor/harbor-db"` |  |
| database.internal.image.tag | string | `"v2.6.1"` |  |
| database.internal.password | string | `"changeit"` |  |
| database.internal.shmSizeLimit | string | `"512Mi"` |  |
| database.internal.nodeSelector | object | `{}` |  |
| database.internal.tolerations | list | `[]` |  |
| database.internal.affinity | object | `{}` |  |
| database.internal.priorityClassName | string | `nil` |  |
| database.internal.initContainer.migrator | object | `{}` |  |
| database.internal.initContainer.permissions | object | `{}` |  |
| database.external.host | string | `"192.168.0.1"` |  |
| database.external.port | string | `"5432"` |  |
| database.external.username | string | `"user"` |  |
| database.external.password | string | `"password"` |  |
| database.external.coreDatabase | string | `"registry"` |  |
| database.external.notaryServerDatabase | string | `"notary_server"` |  |
| database.external.notarySignerDatabase | string | `"notary_signer"` |  |
| database.external.existingSecret | string | `""` |  |
| database.external.sslmode | string | `"disable"` |  |
| database.maxIdleConns | int | `100` |  |
| database.maxOpenConns | int | `900` |  |
| database.podAnnotations | object | `{}` |  |
| redis.type | string | `"internal"` |  |
| redis.internal.serviceAccountName | string | `""` |  |
| redis.internal.automountServiceAccountToken | bool | `false` |  |
| redis.internal.image.repository | string | `"goharbor/redis-photon"` |  |
| redis.internal.image.tag | string | `"v2.6.1"` |  |
| redis.internal.image.pullSecrets[0] | string | `"private-registry"` |  |
| redis.internal.resources.requests.memory | string | `"256Mi"` |  |
| redis.internal.resources.requests.cpu | string | `"100m"` |  |
| redis.internal.resources.limits.memory | string | `"256Mi"` |  |
| redis.internal.resources.limits.cpu | string | `"100m"` |  |
| redis.internal.nodeSelector | object | `{}` |  |
| redis.internal.tolerations | list | `[]` |  |
| redis.internal.affinity | object | `{}` |  |
| redis.internal.priorityClassName | string | `nil` |  |
| redis.external.addr | string | `"192.168.0.2:6379"` |  |
| redis.external.sentinelMasterSet | string | `""` |  |
| redis.external.coreDatabaseIndex | string | `"0"` |  |
| redis.external.jobserviceDatabaseIndex | string | `"1"` |  |
| redis.external.registryDatabaseIndex | string | `"2"` |  |
| redis.external.chartmuseumDatabaseIndex | string | `"3"` |  |
| redis.external.trivyAdapterIndex | string | `"5"` |  |
| redis.external.password | string | `""` |  |
| redis.external.existingSecret | string | `""` |  |
| redis.podAnnotations | object | `{}` |  |
| exporter.replicas | int | `1` |  |
| exporter.revisionHistoryLimit | int | `10` |  |
| exporter.podAnnotations | object | `{}` |  |
| exporter.serviceAccountName | string | `""` |  |
| exporter.automountServiceAccountToken | bool | `false` |  |
| exporter.image.repository | string | `"registry1.dso.mil/ironbank/opensource/goharbor/harbor-exporter"` |  |
| exporter.image.tag | string | `"v2.6.1"` |  |
| exporter.image.pullSecrets[0] | string | `"private-registry"` |  |
| exporter.nodeSelector | object | `{}` |  |
| exporter.tolerations | list | `[]` |  |
| exporter.affinity | object | `{}` |  |
| exporter.cacheDuration | int | `23` |  |
| exporter.cacheCleanInterval | int | `14400` |  |
| exporter.priorityClassName | string | `nil` |  |
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
| trace.otel.timeout | string | `"10s"` |  |
| domain | string | `"bigbang.dev"` |  |
| istio.enabled | bool | `false` |  |
| istio.harbor.gateways[0] | string | `"istio-system/main"` |  |
| istio.harbor.hosts[0] | string | `"harbor.{{ .Values.domain }}"` |  |
| networkPolicies.enabled | bool | `false` |  |
| networkPolicies.ingressLabels.app | string | `"istio-ingressgateway"` |  |
| networkPolicies.ingressLabels.istio | string | `"ingressgateway"` |  |
| cache.enabled | bool | `false` |  |
| cache.expireHours | int | `24` |  |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.
