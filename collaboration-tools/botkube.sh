#!/bin/sh

helm repo add infracloudio https://infracloudio.github.io/charts
helm repo update
cat <<EOF | kubectl apply -f - 
---
apiVersion: v1
kind: Namespace
metadata:
  name: botkube
---
EOF

# export BOTTOKEN=xoxb-1605992000518-1610725878007-6kjucyGbsOlE0hltDA9ccZC3
# export BOT_APP_ID=016d2e9c-2ebb-4b0e-8f76-200d2e295c6c
# export BOT_APP_PWD=6.tVzLsnGC~O~-H7KS5sCfHJRe02~AYnA7
# export BOT_HOST_PATH=devopslab-result.tk

helm upgrade  botkube --namespace botkube \
--install \
--values /home/ubuntu/tools/collaboration-tools/values.yaml -f /home/ubuntu/tools/collaboration-tools/config.yaml \
--set communications.slack.token=$BOTTOKEN \
--set communications.teams.appID=$BOT_APP_ID \
--set communications.teams.appPassword=$BOT_APP_PWD \
--set ingress.host=$BOT_HOST_PATH \
infracloudio/botkube



create_issuer(){
	cat <<EOF | kubectl apply -f - 
---
# prod-issuer.yml
apiVersion: cert-manager.io/v1
kind: Issuer
metadata:
  # different name
  name: letsencrypt-prod
  namespace: botkube
spec:
  acme:
    # now pointing to Let's Encrypt production API
    server: https://acme-v02.api.letsencrypt.org/directory
    email: satish.bansode@yash.com
    privateKeySecretRef:
      # storing key material for the ACME account in dedicated secret
      name: account-key-prod
    solvers:
    - http01:
       ingress:
         class: nginx
---         
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  # different name
  name: botkube-prod-cert
  namespace: botkube
spec:
  # dedicate secret for the TLS cert
  secretName: botkube-production-certificate
  issuerRef:
    # referencing the production issuer
    name: letsencrypt-prod
  dnsNames:
  - $BOT_HOST_PATH
---
EOF
}
a=0

while [ $a -lt 600 ]
do
   echo $a
	CM_RR=$(kubectl get deployment.apps/cert-manager -n cert-manager -o jsonpath='{.status.readyReplicas}')
	CM_R=$(kubectl get deployment.apps/cert-manager -n cert-manager -o jsonpath='{.status.replicas}')

	CM_RR_CI=$(kubectl get deployment.apps/cert-manager-cainjector -n cert-manager -o jsonpath='{.status.readyReplicas}')
	CM_R_CI=$(kubectl get deployment.apps/cert-manager-cainjector -n cert-manager -o jsonpath='{.status.replicas}')

	CM_RR_W=$(kubectl get deployment.apps/cert-manager-webhook -n cert-manager -o jsonpath='{.status.readyReplicas}')
	CM_R_W=$(kubectl get deployment.apps/cert-manager-webhook -n cert-manager -o jsonpath='{.status.replicas}')
	if [ "$CM_RR" -eq "$CM_R" -a "$CM_RR_CI" -eq "$CM_R_CI" -a "$CM_RR_W" -eq "$CM_R_W" ]
   then
      echo 'all good'
	  echo "CM_RR: "$CM_RR 
	  echo "CM_R: "$CM_R
	  echo "CM_RR_CI: "$CM_RR_CI 
	  echo "CM_R_CI: "$CM_R_CI
	  echo "CM_RR_W: "$CM_RR_W 
	  echo "CM_R_W: "$CM_R_W
	  create_issuer
	  break
   else
      sleep 1
      a=`expr $a + 1`
   fi
done

# # command for teams 
# BotKube ping
# BotKube notifier start


# # delete setup
# helm delete botkube -n botkube
# kubectl delete ns botkube 
