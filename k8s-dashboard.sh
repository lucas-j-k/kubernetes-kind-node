#!/bin/bash
# Get dashboard token and run dashboard on proxy

echo Token:
kubectl get secret -n kubernetes-dashboard $(kubectl get serviceaccount restricted-user -n kubernetes-dashboard -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" | base64 --decode

echo
echo ------

kubectl proxy