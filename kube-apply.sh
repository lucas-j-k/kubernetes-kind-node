#!/bin/bash
# deploy resources to cluster
echo Building and pushing Docker images...

docker build -t localhost:5001/kube-node-test_api:latest ./api

echo docker image built and tagged
docker push localhost:5001/kube-node-test_api:latest
echo docker image pushed to Kind registry

sleep 2

echo deploying ingress...
kubectl apply -f ./manifests/ingress.yaml


echo Deploying API server...
# Deploy node API server
kubectl apply -f ./manifests/node-api.yaml

echo refreshing [Api] pods
kubectl rollout restart deployment kube-node-api

sleep 2

echo Complete

# Kubernetes Dashboard
echo Deploying K8s dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml

echo Complete

k get pods
k get pods -n kubernetes-dashboard


