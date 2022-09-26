#!/bin/bash

# Install and configure the default playbook on the local machine.
echo "Updating the local machine..."
sudo apt update -y
sudo apt install software-properties-common -y

# Install Ansible.
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

# To keep the repo clean, I load my defaults from a separate untracked file.
if [ -f ./defaults/.main.yml ]; then
  echo "Overwriting variables with secret defaults..."
  mv ./defaults/.main.yml ./defaults/main.yml
fi
## In CI, I load from a JSON file loaded in the environment.
if [ -f ./defaults/.main.json ]; then
  echo "Overwriting variables with secret defaults..."
  mv ./defaults/.main.json ./defaults/main.yml
fi


echo "Install Ansible Galaxy requirements"
ansible-galaxy install -r requirements.yml

echo "Running playbook"
sudo ansible-playbook ./linux-dev.yml --extra-vars "@./defaults/main.yml"