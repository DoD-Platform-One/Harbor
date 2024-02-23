{{/*
Selector labels
*/}}
{{- define "harbor.bigbangSelectorLabels" -}}
app: {{ include "harbor.name" . }}
{{- end }}
