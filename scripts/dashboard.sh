#!/bin/bash

################
# Deploy K8s Dashboard
# 
################
echo Deploying K8s dashboard...
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml

kubectl get pods
kubectl get pods -n kubernetes-dashboard

################
# Create demo user for dashboard
################
echo Creating user
echo Creating dashboard user...
kubectl apply -f ./manifests/restricted-user.yaml


################
# Generate token for dashboard access
################
echo Token:
kubectl get secret -n kubernetes-dashboard $(kubectl get serviceaccount restricted-user -n kubernetes-dashboard -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" | base64 --decode



################
# Leave proxy running so dashboard is available on localhost
################
echo ------
kubectl proxy