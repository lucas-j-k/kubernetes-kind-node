# Kubernetes node api + cron with KinD

Basic node server and cron job. Runs a simple express server in a pod which recieves requests ar `/log`. Cronjob run to generate requests to the log endpoint.

### Kind
KinD runs a kubernetes node as a Docker container

### To run

- `bash ./scripts/cluster-init.sh` - spins up a KinD cluster in Docker, along with a local Docker image repository (so we can build Docker images and deploy them without external DockerHub)

- `bash ./scripts/deploy.sh` - uses Kubectl to apply the node service manifests

- `bash ./scripts/dashboard.sh` - run kubernetes dashboard via kubectl proxy, and generate access token


### Notes
- Docker Registry with KinD: https://kind.sigs.k8s.io/docs/user/local-registry/
- There is a separate manifest to add an ingress, to allow traffic into the cluster.
- Since we are using a separate ingress, the services for resources inside the cluster only need to be ClusterIP, as they only need to be reachable inside the cluster (i.e Ingress >> Service).