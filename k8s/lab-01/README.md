# Create Namesspace 
kubectl get ns
kubectl create ns ns-my-first-pod
```
  # other option is via yaml file
cat << EOF > ns-my-first-pod.yaml 
apiVersion: v1
kind: Namespace
metadata:
  name: test
EOF
```

