#!/bin/bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

kubectl get ns | grep -i 'kubecost' &> /dev/null
if [ $? == 0 ]; then
   echo "kubecost already installed"
else
   echo "kubecost not installed already. Installing Kubecost now!"
   echo "Installing KubeCost"

   kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=testuser

   kubectl create clusterrolebinding cluster-self-admin-binding --clusterrole=cluster-admin --serviceaccount=kube-system:default

   kubectl create namespace kubecost
   helm repo add kubecost https://kubecost.github.io/cost-analyzer/
   helm install kubecost kubecost/cost-analyzer --namespace kubecost --set kubecostToken=$KUBECOST --set service.type=ClusterIP --set prometheus.nodeExporter.enabled=false --set prometheus.serviceAccounts.nodeExporter.create=false
   cd kubecost
   kubectl apply -f ingress.yaml
fi
