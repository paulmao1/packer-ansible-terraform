#!/usr/bin/env bash
# Install Packer
if [ ! -f "packer_1.4.5_linux_amd64.zip" ]; then
wget -c https://releases.hashicorp.com/packer/1.4.5/packer_1.4.5_linux_amd64.zip
fi
unzip packer_1.4.5_linux_amd64.zip
mv packer /usr/sbin
#Install terraform
if [ ! -f "terraform_0.12.16_linux_amd64.zip" ]; then
wget -c https://releases.hashicorp.com/terraform/0.12.16/terraform_0.12.16_linux_amd64.zip
fi
unzip terraform_0.12.16_linux_amd64.zip
mv terraform /usr/sbin

#Install Ansible
apk add ansible

