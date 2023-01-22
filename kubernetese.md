# System Requirements
- [kubernetes](https://kubernetes.io/releases/download/)
  - I installed via `choco install kubernetes-cli`
- `minikube` installed via `choco install minikube` (only needed for local testing)
- Start minikube with `minikube start --insecure-registry <ip address of your computer>:5000`

- Create your deployment from the local image `kubectl create -f .\api-deployment.yaml`
- Create service for your deployment `kubectl create -f .\service.yaml` (Notes: `--port=80` has to match the port the application is listening on. `--type=LoadBalancer` is required so that your service is reachable outside of the cluster)
- Start the service in the kube cluster `minikube service rest-api`

