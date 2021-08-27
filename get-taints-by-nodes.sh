# simple
kubectl get nodes -o custom-columns=NAME:.metadata.name,TAINTS:.spec.taints --no-headers

# pro
kubectl get nodes -o go-template='{{printf "%-50s %-12s\n" "Node" "Taint"}}\
{{- range .items}}\
{{- if $taint := (index .spec "taints") }}\
{{- .metadata.name }}{{ "\t" }}{{- range $taint }}{{- .key }}={{ .value }}:{{ .effect }}{{ "\t" }}{{- end }}{{- "\n" }}{{- end}}{{- end}}'
