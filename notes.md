# Notes

- NodeJS API server deployed to kubernetes
- ```manifests/kind-cluster-registry-setup.sh``` creates a KinD cluster with a local Docker registry, so we can build Docker images and deploy them without external Kubernetes or DockerHub. Taken from the Kind docs > Local Registry

## Docker Registry with KinD:
- https://kind.sigs.k8s.io/docs/user/local-registry/


## To Deploy from scratch with KinD installed
- Start up Kind with Docker server using ```bash ./bash-scripts/cluster-init.sh```
- Run ```bash ./bash-scripts/kube-apply.sh``` to apply the manifests to create the resources
- Run ```bash ./bash-scripts/k8s-dashboard.sh``` to start the Kubernetes dashboard locally via Kubectl proxy, and generate an access token

## Resources
### API
- simple express server to receive requests at ```/log``` and print them to the console

### Sender
- simple CronJob to send dummy requests to the API server at ```/log```

## Notes
- There is a separate manifest to add an ingress, to allow traffic into the cluster.
- Since we are using a separate ingress, the services for resources inside the cluster only need to be ClusterIP, as they only need to be reachable inside the cluster (i.e Ingress >> Service).