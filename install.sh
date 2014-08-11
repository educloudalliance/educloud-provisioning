#!/bin/bash

fail=false
if ! which virtualbox &>/dev/null ; then
    echo "Virtualbox required" >&2
    echo "Install Virtualbox with sudo apt-get install virtualbox"
    fail=true
fi

if ! which vagrant &>/dev/null ; then
    echo "Vagrant required" >&2
    echo "Install Vagrant with sudo apt-get install vagrant"
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
fi

if $fail ; then
    exit 1
fi

vagrant destroy -f && vagrant up
exit $?