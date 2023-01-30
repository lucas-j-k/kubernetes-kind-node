# Notes

- NodeJS API server deployed to kubernetes
- ```manifests/kind-cluster-registry-setup.sh``` creates a KinD cluster with a local Docker registry, so we can build Docker images and deploy them without external Kubernetes or DockerHub. Manifest taken from the Kind docs > Local Registry

## Docker Registry with KinD:
- https://kind.sigs.k8s.io/docs/user/local-registry/


## To Deploy from scratch with KinD installed
- Start up Kind with Docker server using ```bash kind-cluster-registry-setup.sh```
- Build the Docker image, push to local registry and apply the Kubernetes manifest yaml files with ```bash kube-apply.sh```

## Notes
- There is a separate manifest to add an ingress, to allow traffic into the cluster.
- Since we are using a separate ingress, the services for resources inside the cluster only need to be ClusterIP, as they only need to be reachable inside the cluster (i.e Ingress >> Service).