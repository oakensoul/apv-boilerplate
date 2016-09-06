#!/usr/bin/env bash

export PYTHONUNBUFFERED=1
export ANSIBLE_FORCE_COLOR=1

echo "Ansible Provisioning:"

cd /vagrant/inf/ansible

echo "  1/2. Install Ansible Galaxy Roles"
ansible-galaxy install -r requirements.yml --force

echo "  2/2. Ansible (allthethings)..."
ansible-playbook vagrant.yml --inventory-file=inventory/vagrant.ini --connection=local

echo "Ansible Provisioning: Done!"
