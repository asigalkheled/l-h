# Helm - Install Prometheus on K8s using Helm
## For more info go to Monitor Repo
## For Helm practice go to lesson-argocd -> practice-03 ->README.md
- Maintained by Prometheus Community
- Installation list
  - Prometheus
  - Grafana
  - Alertmanager
  - Node Exporter
  - kube-state-metrics

### Add and Install Helm Repository
```
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
kubectl get ns
kubectl create namespace monitoring
kubectl get ns
helm install prometheus prometheus-community/kube-prometheus-stack   --namespace monitoring
kubectl get pods -n monitoring
kubectl get svc -n monitoring
kubectl port-forward svc/prometheus-grafana 3000:80 -n monitoring

```

- Get Grafana user admin, Run the command below for Password
- Login via the browser
```
kubectl get secret prometheus-grafana -n monitoring \
  -o jsonpath="{.data.admin-password}" | base64 --decode
```

```
http://127.0.0.1:3000/
```

### Access Prometheus UI

```
kubectl port-forward svc/prometheus-kube-prometheus-prometheus 9090:9090 -n monitoring
```

```
http://localhost:9090
```

#### Test Prometheus Dashboard
- PromQL Example
- CPU usage percentage approximation
- Change the time on Prometheus Dashboard

```
rate(process_cpu_seconds_total[1m])
rate(process_cpu_seconds_total[1m]) * 100
```

- From git bash cli
```
kubectl run cpu-test \
  --image=busybox \
  --restart=Never \
  -- sh -c "while true; do :; done"

```
##### Common Helm Commands

```
helm list -n monitoring
helm upgrade prometheus prometheus-community/kube-prometheus-stack \
  -n monitoring
helm uninstall prometheus -n monitoring

```

