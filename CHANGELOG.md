# Changelog

Format: [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)

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
