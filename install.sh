#!/bin/bash

# Install and configure the default playbook on the local machine.
echo "Updating the local machine..."
sudo apt update
sudo apt install software-properties-common

# Install Ansible.
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible

# To keep the repo clean, I load my defaults from a separate untracked file.
if ./defaults/.main.yml; then
  mv ./defaults/.main.yml ./defaults/main.yml
fi

echo "Install Ansible Galaxy requirements"
ansible-galaxy install -r requirements.yml

echo "Running playbook"
ansible-playbook ./playbooks/linux-dev.yml