# Argo CD - GitOps

Argo CD is a Kubernetes-native continuous deployment (CD) tool. Unlike external CD tools that only enable push-based deployments, Argo CD can pull updated code from Git repositories and deploy it directly to Kubernetes resources

To trigger Argo CD automatically after your GitHub Actions CI pipeline, you need to ensure Argo CD pulls the latest changes from your Git repository — this is how GitOps works

**Note:** For More Explanation of ArgoCD manifest install.yaml file componentes go to end of page


## Remote Server and Local PC
### Remote Server
- PreRequisite:
- Install k8s
- GitHub user
- Docker Hub user

```
kubectl create namespace argocd
kubectl get ns
kubectl config set-context --current --namespace=argocd
kubectl config get-contexts
kubectl config get-contexts | awk '{print $1,"        "$5 }'
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
  # Go to the buttom of page in order to see the info of Manifest install.yaml file 
kubectl get all -n argocd
kubectl get pod -n argocd
kubectl get svc -n argocd
kubectl config set-context --current --namespace=argocd
  # Run the LoadBalancer on cloud
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
kubectl get svc -n argocd
kubectl get svc -n argocd -o wide --watch

 # Run the NodePort locally
kubectl patch svc argocd-server -n argocd   -p '{"spec": {"type": "NodePort"}}'
kubectl get svc -n argocd
kubectl get svc -n argocd -o wide --watch
kubectl port-forward svc/argocd-server -n argocd 8080:443

# New trminal
kubectl get svc -n argocd
kubectl get svc -n argocd -o wide --watch
```

- Go to the Browser and login to the ArgoCD login page with port 80
```
# With LB
  http://<External-IP-Address-of-LB>:80
# With NodePort
kubectl port-forward svc/argocd-server -n argocd 8080:443
  http://localhost:8080
```
  - User: admin
  - Password: from command, kubectl -n argocd get secret command

```
  # Generate the password and type into login page of argocd
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d
```

