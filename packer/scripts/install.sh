#!/bin/bash
# Install ansible tools on the Ubuntu image
sudo apt-get update
sudo apt-get install git dialog apt-utils software-properties-common ansible -y
sudo mkdir /var/ansible_playbooks
#git clone ${playbook_repository} /var/ansible_playbooks
