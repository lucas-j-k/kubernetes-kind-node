#!/bin/bash
# deploy resources to cluster

# User for dashboard
echo Creating dashboard user...
kubectl apply -f ./manifests/restricted-user.yaml

# ConfigMap
echo Creating configMap...
kubectl apply -f ./manifests/configmap.yaml

echo deploying API Ingress...
kubectl apply -f ./manifests/api-ingress.yaml


# API Server
echo Building API Server...
docker build -t localhost:5001/kube-node-test_api:latest ./api
docker push localhost:5001/kube-node-test_api:latest

echo Deploying API server...
kubectl apply -f ./manifests/node-api.yaml

echo refreshing [Api] pods...
kubectl rollout restart deployment kube-node-api


# Kubernetes Dashboard
echo Deploying K8s dashboard...
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml

kubectl get pods
kubectl get pods -n kubernetes-dashboard


# Cronjob to generate requests
echo Deploying CronJob...
docker build -t localhost:5001/kube-node-test_sender:latest ./sender
docker push localhost:5001/kube-node-test_sender:latest

kubectl apply -f ./manifests/sender.yaml

echo Pods:
kubectl get pods --watch


