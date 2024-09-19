{{/* vim: set filetype=mustache: */}}

{{- if not (and .Values.app .Values.app.name .Values.app.version) -}}
{{- fail "app section not properly defined" -}}
{{- end -}}

{{/*
Set chart name
*/}}
{{- define "helper.chartName" -}}
{{- .Values.app.name | replace "+" "_" | replace "." "_" | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{/*
Set namespace
*/}}
{{- define "helper.namespace" -}}
{{ .Values.app.namespace | default "default" | quote }}
{{- end -}}

{{/*
Set service account
*/}}
{{- define "helper.serviceAccount" -}}
{{- if .Values.serviceAccount -}}
{{- if .Values.serviceAccount.autoName -}}
{{- printf "%s-serviceaccount" (include "helper.chartName" .) | quote }}
{{- else -}}
{{ .Values.serviceAccount.name | default "default" | quote }}
{{- end -}}
{{- else -}}
"default"
{{- end -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "helper.labels" -}}
helm.sh/chart: {{ include "helper.chartName" . }}
{{ include "helper.selectorLabels" . }}
app.kubernetes.io/version: {{ .Values.app.version | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "helper.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.app.name | quote }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
