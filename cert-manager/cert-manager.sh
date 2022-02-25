#!/bin/sh
ls
kubectl apply -f cert-manager/cert-manager.yaml

 curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
 chmod 700 get_helm.sh
 ./get_helm.sh

# cat <<EOF | kubectl apply -f - 
# ---
# apiVersion: v1
# kind: Namespace
# metadata:
#   name: cert-manager
# ---
# EOF

# #add jetstack repo 
# helm repo add jetstack https://charts.jetstack.io
# helm repo update

# #install all custome resource definations 
# kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.3.0/cert-manager.crds.yaml

# #install helm chart
# helm upgrade \
#  --install \
#  cert-manager jetstack/cert-manager \
#  --namespace cert-manager \
#  --create-namespace 


