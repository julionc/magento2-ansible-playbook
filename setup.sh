#! /bin/bash

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as sudo"
   echo "-------------------------------------------"
   echo "This is what you should type into terminal:"
   echo "sudo bash setup.sh"
   exit 1
fi

REQUIRED_PKG="ansible"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
  sudo apt-get update
  sudo apt-get install -y software-properties-common
  sudo apt-add-repository ppa:ansible/ansible --y
  sudo apt-get update
  sudo apt-get --yes install $REQUIRED_PKG
fi

# Setup
sudo ansible-playbook -c local -i localhost,telefonica,telefonica-mb playbook.yml
exit
ln -sf roles/utils/templates/bash_aliases.j2 ~/.bash_aliases
exit
exec $SHEL

# FIX: Se crea symlink para importador de imágenes
cd /home/magento/Sites/telefonica
mkdir -p var/import
cd var/import
ln -s /home/magento/Sites/telefonica/pub/media/import/ images
cd ..
cd ..
m2fixperms