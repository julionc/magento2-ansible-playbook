# Magento2 Ansible PlayBook

This is an Ansible Playbook for Magento 2. It is used to set up a quick developer environment on a server.

This playbook was tested on Ubuntu 20.04.

## Pre-Installation

To configure the PPA on your machine and install ansible run these commands:

```
sudo apt-get update
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible -y
```

## Installation

Update the values in:

* hosts
* group_vars/all.yml

Then after editing, run:

```
ansible-playbook -c local -i localhost, playbook.yml
```

## Check Syntax

Basic role syntax check

```
ansible-playbook -c local -i localhost, playbook.yml --syntax-check
```
