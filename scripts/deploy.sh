#!/bin/bash

################
# ConfigMap
# ENV variables to inject into pods
################
echo Creating configMap...
kubectl apply -f ./manifests/configmap.yaml

echo deploying API Ingress...
kubectl apply -f ./manifests/api-ingress.yaml

################
# API Server 
# Node + Express server
################
echo Building API Server...
docker build -t localhost:5001/kube-node-test_api:latest ./api
docker push localhost:5001/kube-node-test_api:latest

echo Deploying API server...
kubectl apply -f ./manifests/node-api.yaml

echo refreshing [Api] pods...
kubectl rollout restart deployment kube-node-api


################
# Cronjob 
################
echo Deploying CronJob...
docker build -t localhost:5001/kube-node-test_sender:latest ./sender
docker push localhost:5001/kube-node-test_sender:latest

kubectl apply -f ./manifests/sender.yaml

################
# Print out deployed pods
################
echo Initialised Pods:
kubectl get pods


