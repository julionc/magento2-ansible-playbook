#! /bin/bash

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as sudo"
   echo "-------------------------------------------"
   echo "This is what you should type into terminal:"
   echo "sudo bash setup.sh"
   exit 1
fi

sudo ansible-playbook -c local -i localhost,telefonica,telefonica-mb playbook.yml
exec $SHELL