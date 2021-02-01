Note: offline harbor helm chart came from
```bash
helm repo add harbor https://helm.goharbor.io
helm search repo harbor
helm fetch harbor/harbor --version 1.5.2
# generates file named harbor-1.5.2.tgz, which is an offline helm chart
```
