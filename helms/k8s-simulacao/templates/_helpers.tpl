{{/*
Expand the name of the chart.
*/}}
{{- define "k8s-referencia.name" -}}
{{- default .Chart.Name "k8s-stress" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "k8s-referencia.fullname" -}}
{{- $name := default .Chart.Name "k8s-stress" }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "k8s-referencia.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "k8s-referencia.labels" -}}
helm.sh/chart: {{ include "k8s-referencia.chart" . }}
{{ include "k8s-referencia.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "k8s-referencia.selectorLabels" -}}
app.kubernetes.io/name: {{ include "k8s-referencia.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the persistent volume claim
*/}}
{{- define "k8s-referencia.persistentVolumeClaimName" -}}
{{- $prefix := default .Values.namePrefix "k8s" }}
{{- printf "%s-result-storage" $prefix | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the name of sockperf server
*/}}
{{- define "k8s-referencia.sockPerfServerName" -}}
{{- $prefix := default .Values.namePrefix "k8s" }}
{{- printf "%s-sockperf-srv-1" $prefix | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the name of etg server server
*/}}
{{- define "k8s-referencia.etgServer" -}}
{{- $prefix := default .Values.namePrefix "k8s" }}
{{- printf "%s-etg-srv" $prefix | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the name of the iperf server
*/}}
{{- define "k8s-referencia.iPerfServerName" -}}
{{- $prefix := default .Values.namePrefix "k8s" }}
{{- printf "%s-iperf-srv-1" $prefix | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the name of stress job
*/}}
{{- define "k8s-referencia.stressJobName" -}}
{{- $prefix := default .Values.namePrefix "k8s" }}
{{- printf "%s-sock-job" $prefix | trunc 63 | trimSuffix "-" }}
{{- end }}
