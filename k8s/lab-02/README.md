# Service type of ClusterIP - Internally
In Kubernetes, Services (svc) are used to expose applications running in pods, There are different types of services, each 
suited for different use cases.

**Note:** - Go to exercise-05 for more information of **Network**
  - ClusterIP
  - NodePort
  - LoadBalancer
  - ExternalName
    
# Pod type of ClusterIP ( Internal IP )
- Cleanup if needed
- Create pod and expose svc type of ClusterIP (Default), Based on example-pod of exercise-01​
- Exposes the service only within the cluster​
- login internally to my-clusterip-service.yml inside pod and via port forwarding

```
kubectl get all
kubectl config set-context --current --namespace=ns-my-first-pod
kubectl get pod
kubectl get rs
kubectl delete pod example-pod
 or
kubectl edit rs example-pod                                  # pod delete if needed  rs = 0
 or
kubectl delete pod example-pod --force --grace-period=0      # Force delete
kubectl get pod
  kubectl get pods --all-namespaces
kubectl get svc
kubectl delete svc my-clusterip-service
kubectl apply -f ../exercise-01/my-first-pod.yaml
kubectl get pod
```
```
kubectl expose pod example-pod \
  --name=my-clusterip-service \
  --port=80 \
  --target-port=80 \
  --type=ClusterIP
```

```
kubectl get pod
kubectl get rs
kubectl get svc
kubectl get all

# Test, lets go into example-pod
kubectl exec -it example-pod -- sh
curl http://my-clusterip-service
  # Output is internally the nginx page
```
## Service with type of Cluster IP
- Run the my-pod-rs-svc.yaml file
- Check with describe command the Service type

```
kubectl apply -f my-pod-rs-svc.yaml

```

### NodePort dogs-cats example 
```
kubectl apply -f dogs-cats.yaml
kubectl get all
kubectl get nodes
kind get clusters
kubectl config get-contexts
kubectl get svc
kubectl describe svc cats-service
kubectl describe pod/cats-rs-5wq9x
kubectl get all
kubectl port-forward service/cats-service 30001:80
kubectl port-forward service/dogs-service 30002:80

  #Test from Browser
http:localhost:30001
http:localhost:30002
```





