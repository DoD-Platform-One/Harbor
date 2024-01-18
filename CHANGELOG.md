# Changelog

Format: [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)

## [1.14.0-bb.1] - 2024-01-15
### Changed
- Updating gluon to 0.4.7
- Updated cypress test to delete resources created by it
- Removed cypress config as it is now using shared config

## [1.13.1-bb.5] - 2024-01-02
### Changed
- Updating app version from 2.9.1 to 2.10.0

## [1.13.1-bb.4] - 2023-12-22
### Changed
- Removed chartmuseum as it was deprecated upstream

## [1.13.1-bb.3] - 2023-11-29
### Changed
- Fix README
- Update gluon to 0.4.4

## [1.13.1-bb.2] - 2023-11-21
### Changed
- update securityContext to enforce non-root-group

## [1.13.1-bb.1] - 2023-11-16
### Changed
- Updated registry1.dso.mil/ironbank/big-bang/base 2.0.0 -> 2.1.0

## [1.13.1-bb.0] - 2023-11-03
### Changed
- Updated app to v2.9.1 and helm chart to v1.13.1 
- goharbor/redis-photon minor v2.9.0 -> v2.9.1
- ironbank/opensource/goharbor/harbor-core minor v2.9.0 -> v2.9.1
- registry1.dso.mil/ironbank/opensource/goharbor/harbor-core minor v2.9.0 -> v2.9.1
- registry1.dso.mil/ironbank/opensource/goharbor/harbor-exporter minor v2.9.0 -> v2.9.1
- registry1.dso.mil/ironbank/opensource/goharbor/harbor-jobservice minor v2.9.0 -> v2.9.1
- registry1.dso.mil/ironbank/opensource/goharbor/harbor-portal minor v2.9.0 -> v2.9.1
- registry1.dso.mil/ironbank/opensource/goharbor/harbor-registryctl minor v2.9.0 -> v2.9.1
- registry1.dso.mil/ironbank/opensource/goharbor/registry minor v2.9.0 -> v2.9.1
- registry1.dso.mil/ironbank/opensource/goharbor/trivy-adapter minor v2.9.0 -> v2.9.1


## [1.13.0-bb.4] - 2023-10-31
### Changed
- Updated registry1.dso.mil/ironbank/bitnami/postgres-exporter 0.12.1 -> 0.15.0
- Updated registry1.dso.mil/ironbank/opensource/nginx/nginx 1.25.2 -> 1.25.3
- Updated registry1.dso.mil/ironbank/opensource/postgres/postgresql12 12.15 -> 12.16

## [1.13.0-bb.3] - 2023-10-30
### Changed
- update renovate.json

## [1.13.0-bb.2] - 2023-10-26
### Changed
- add maintenance documentation 

## [1.13.0-bb.1] - 2023-10-24
### Changed
- updated bigbang virtual service to address registry authentication issue
- add ServiceEntry config

## [1.13.0-bb.0] - 2023-10-23
### Changed
- Updated app to v2.9.0 and helm chart to v1.13.0 
- goharbor/redis-photon minor v2.8.4 -> v2.9.0
- ironbank/opensource/goharbor/harbor-core minor v2.8.4 -> v2.9.0
- registry1.dso.mil/ironbank/opensource/goharbor/chartmuseum minor v2.7.2 -> v2.7.3
- registry1.dso.mil/ironbank/opensource/goharbor/harbor-core minor v2.8.4 -> v2.9.0
- registry1.dso.mil/ironbank/opensource/goharbor/harbor-exporter minor v2.8.4 -> v2.9.0
- registry1.dso.mil/ironbank/opensource/goharbor/harbor-jobservice minor v2.8.4 -> v2.9.0
- registry1.dso.mil/ironbank/opensource/goharbor/harbor-portal minor v2.8.4 -> v2.9.0
- registry1.dso.mil/ironbank/opensource/goharbor/harbor-registryctl minor v2.8.4 -> v2.9.0
- registry1.dso.mil/ironbank/opensource/goharbor/registry minor v2.8.4 -> v2.9.0
- registry1.dso.mil/ironbank/opensource/goharbor/trivy-adapter minor v2.8.4 -> v2.9.0
- registry1.dso.mil/ironbank/opensource/nginx/nginx patch 1.25.1 -> 1.25.2
- registry1.dso.mil/ironbank/opensource/postgres/postgresql12 minor 12.15 -> 12.16

## [1.12.4-bb.5] - 2023-10-16
### Changed
- Fixed Security Context 

## [1.12.4-bb.4] - 2023-10-11
### Added
- Added non-root group user

## [1.12.4-bb.3] - 2023-10-06
### Changed
- image order in the Chart.yaml to fix bug with exporter image not showing in images package

## [1.12.4-bb.2] - 2023-10-03
### Changed
- redis.external to use master service endpoint

## [1.12.4-bb.1] - 2023-09-20
### Changed
- Updated gluon to 0.4.1 and Cypress to 13.x

## [1.12.4-bb.0] - 2023-08-17
### Changed
- Updated app to v2.8.4 and helm chart to v1.12.4

## [1.12.2-bb.7] - 2023-07-31
### Removed
- `bigbang/` integration CI only folder and templates.

## [1.12.2-bb.6] - 2023-07-30
### Changed
- Fix readme.md

## [1.12.2-bb.5] - 2023-07-13
### Added
- Adding Helm Cypress Egress policy to allow the cypress tests to resolve *.bigbang.dev.

## [1.12.2-bb.4] - 2023-07-13
### Added
- Adding Security context to drop all capabilities to reduce syscall attack surface.  Capabilities permit certain named root actions without giving full root access.git 

## [1.12.2-bb.3] - 2023-07-10
### Added
- Updating dependencies for postgres, nginx.

## [1.12.2-bb.2] - 2023-06-30
### Added
- Enabling Istio mTLS

## [1.12.2-bb.1] - 2023-05-03
### Added
- Added cypress and script automated tests to validate installation
- increased gluon test package v0.3.1 -> v0.3.2


## [1.12.2-bb.0] - 2023-05-03
### Added
- goharbor/redis-photon minor v2.6.2 -> v2.8.2
- ironbank/opensource/goharbor/harbor-core minor v2.6.2 -> v2.8.2
- registry1.dso.mil/ironbank/bitnami/postgres-exporter minor 0.11.1 -> 0.12.0
- registry1.dso.mil/ironbank/opensource/goharbor/chartmuseum minor v2.6.2 -> v2.7.2
- registry1.dso.mil/ironbank/opensource/goharbor/harbor-core minor v2.6.2 -> v2.8.2
- registry1.dso.mil/ironbank/opensource/goharbor/harbor-exporter minor v2.6.2 -> v2.8.2
- registry1.dso.mil/ironbank/opensource/goharbor/harbor-jobservice minor v2.6.2 -> v2.8.2
- registry1.dso.mil/ironbank/opensource/goharbor/harbor-portal minor v2.6.2 -> v2.8.2
- registry1.dso.mil/ironbank/opensource/goharbor/harbor-registryctl minor v2.6.2 -> v2.8.2
- registry1.dso.mil/ironbank/opensource/goharbor/notary-server minor v2.6.2 -> v2.8.2
- registry1.dso.mil/ironbank/opensource/goharbor/notary-signer minor v2.6.2 -> v2.8.2
- registry1.dso.mil/ironbank/opensource/goharbor/registry minor v2.6.2 -> v2.8.2
- registry1.dso.mil/ironbank/opensource/goharbor/trivy-adapter minor v2.6.2 -> v2.8.2
- registry1.dso.mil/ironbank/opensource/nginx/nginx patch 1.23.2 -> 1.23.3
- registry1.dso.mil/ironbank/opensource/postgres/postgresql12 minor 12.12 -> 12.14

## [1.10.2-bb.8] - 2023-03-01
### Added
- Added harbor architecture overview documentation

## [1.10.2-bb.7] - 2023-02-17
### Changed
- removed duplicate database.internal.initContainer.resources within values.yaml

## [1.10.2-bb.6] - 2023-02-08
### Changed
- Core secret templates
### Added
- Production.md documentation section for key generation and usage

## [1.10.2-bb.5] - 2023-01-17
### Changed
- External Database helper templates

## [1.10.2-bb.4] - 2023-01-06
### Added
- Add Resource values for every pod to set Guaranteed QoS

### Added
- Standard network policies added to the `templates/bigbang` directory

## [1.10.2-bb.2] - 2022-12-16
### Added
- Grafana Dashboard template from upstream harbor repo.

## [1.10.2-bb.1] - 2022-12-15
### Changed
- Updated gluon and redis dependencies to target registry1 bigbang oci registry
- Fixed templating with big bang virtualservice

## [1.10.2-bb.0] - 2022-11-21
### Changed
- goharbor/redis-photon patch v2.6.1 -> v2.6.2
- registry1.dso.mil/ironbank/bitnami/postgres-exporter minor 0.10.1 -> 0.11.1
- registry1.dso.mil/ironbank/opensource/goharbor/chartmuseum patch v2.6.1 -> v2.6.2
- registry1.dso.mil/ironbank/opensource/goharbor/harbor-exporter patch v2.6.1 -> v2.6.2
- registry1.dso.mil/ironbank/opensource/goharbor/harbor-portal patch v2.6.1 -> v2.6.2
- registry1.dso.mil/ironbank/opensource/goharbor/harbor-registryctl patch v2.6.1 -> v2.6.2
- registry1.dso.mil/ironbank/opensource/goharbor/notary-server patch v2.6.1 -> v2.6.2
- registry1.dso.mil/ironbank/opensource/goharbor/notary-signer patch v2.6.1 -> v2.6.2
- registry1.dso.mil/ironbank/opensource/goharbor/trivy-adapter patch v2.6.0 -> v2.6.2
- registry1.dso.mil/ironbank/opensource/nginx/nginx patch 1.23.1 -> 1.23.2
- registry1.dso.mil/ironbank/opensource/postgres/postgresql12 minor 12.11 -> 12.12

## [1.10.1-bb.3] - 2022-11-16
### Changed
- Fixing integration pipeline stage

## [1.10.1-bb.2] - 2022-11-09
### Changed
- adding `redis` to chart

## [1.10.1-bb.1] - 2022-10-25
### Changed
- adding `postgresql` to chart

## [1.10.1-bb.0] - 2022-10-19
### Changed
- values for ironbank images to 2.6.1 except for `trivy adapter` which will be at 2.6.0

## [1.9.3-bb.2] - 2022-10-12
### Added
- bigbang/ folder for BigBang integration stage
- tests/test-values.yaml folder for successful CI

### Changed
- values for successful CI deployment

## [1.9.3-bb.1] - 2022-09-19
### Added
- updated values to pull images from IronBank

## [1.9.3-bb.0] - 2022-09-02
### Added
- updated helm chart to `1.9.3`

## [1.8.1-bb.0] - 2022-03-08
### Added
- Initial Helm chart
- Required Documents (Readme, Changelog, Contributing, License)
