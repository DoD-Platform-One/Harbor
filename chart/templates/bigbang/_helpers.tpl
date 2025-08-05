{{/*
Selector labels
*/}}
{{- define "harbor.bigbangSelectorLabels" -}}
app: {{ include "harbor.name" . }}
{{- end }}

{{/* core component service port */}}
{{- define "harbor.BBcore.servicePort" -}}
  {{- if .Values.upstream.internalTLS.enabled -}}
    {{- printf "443" -}}
  {{- else -}}
    {{- printf "80" -}}
  {{- end -}}
{{- end -}}

{{/* registry component container port */}}
{{- define "harbor.BBregistry.containerPort" -}}
  {{- if .Values.upstream.internalTLS.enabled -}}
    {{- printf "5443" -}}
  {{- else -}}
    {{- printf "5000" -}}
  {{- end -}}
{{- end -}}
