#!/bin/bash

sudo apt-get install wget -y
wget  https://github.com/controlplaneio/kubesec/releases/download/v2.11.0/kubesec_linux_amd64.tar.gz

tar -xvf  kubesec_linux_amd64.tar.gz
ls

mv kubesec /usr/bin/


# To Scan image
# kubesec scan <PATH OF YAML>
