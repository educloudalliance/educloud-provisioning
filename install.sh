#!/bin/bash

fail=false

if [ ! -d /mnt/basaar ] ; then
    echo "Create folder /mnt/basaar"
    fail=true
fi

if ! which virtualbox &>/dev/null ; then
    echo "Virtualbox required" >&2
    echo "Install Virtualbox with sudo apt-get install virtualbox"
    fail=true
elif [ `vboxmanage --version | sed 's/_.*//' | tr -dc [:digit:]` -lt 4112 ] ; then
    echo "Please update your virtualbox"
    fail=true
fi

if ! which vagrant &>/dev/null ; then
    echo "Vagrant required" >&2
    echo "Download latest vagrant from website http://www.vagrantup.com/downloads"
    echo "and install."
    fail=true
elif [ `vagrant -v | sed 's/.*[ \t]//' | tr -dc [:digit:]` -lt 163 ] ; then
    echo "Please update your vagrant"
    fail=true
fi

if ! which pip &>/dev/null ; then
    echo "pip required" >&2
    echo "Install pip with sudo apt-get install python-pip"
    fail=true
fi

if ! which ansible &>/dev/null ; then
    echo "Ansible required" >&2
    echo "Install Ansible with sudo pip install ansible"
    fail=true
elif [ `ansible --version | sed 's/.*[ \t]//' | tr -dc [:digit:]` -lt 17 ] ; then
    echo "Please update your ansible"
    fail=true
fi

if $fail ; then
    exit 1
fi

vagrant destroy -f && vagrant up

res=$?
if [ $res -gt 0 ] ; then
    exit $res
fi

echo "Basaar is successfully installed. To run server login to"
echo "vagrant box using 'vagrant ssh' command and run command"
echo "/home/vagrant/basaar/sites/basaar/manage.py runserver 0.0.0.0:8000"
echo "Source code is located in host machine /mnt/basaar, you can use that"
echo "with your favourite IDE. :-)"
exit 0