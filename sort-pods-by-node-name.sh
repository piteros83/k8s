kubectl get pods -o wide --sort-by="{.spec.nodeName}"
# Example of getting pods on nodes using label filter:
for n in $(kubectl get nodes -l your_label_key=your_label_value --no-headers | cut -d " " -f1); do 
    kubectl get pods --all-namespaces  --no-headers --field-selector spec.nodeName=${n} 
done
#or by number of restarts
kubectl get pods --sort-by="{.status.containerStatuses[:1].restartCount}"
