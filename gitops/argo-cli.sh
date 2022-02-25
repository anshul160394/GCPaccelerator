#!/bin/bash
export ARGO_VERSION="v2.9.1"
curl -sSL -o /usr/local/bin/argo https://github.com/argoproj/argo/releases/download/${ARGO_VERSION}/argo-linux-amd64
chmod +x /usr/local/bin/argo
echo "Hello"
