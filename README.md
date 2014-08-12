# [pilvivayla-basaari](https://github.com/koulutuksenpilvivayla/pilvivayla-basaari) development environment

To start developing pilvivayla-basaari project, you can use this Vagrant box and ansible playbooks to setup isolated development environment.

## Requirements

These components needs to be installed to your host machine (computer that you’re using for development):

* Virtualbox (v. 4.1.12 or higher)
* Vagrant (v. 1.6.3 or higher)
* pip (v. 1.0 or higher)
* Ansible (v. 1.7 or higher)

# Usage

## First time usage

To setup vagrantbox to your host machine, clone the repository

`git clone https://github.com/koulutuksenpilvivayla/pilvivayla-provisioning.git`

Run command from the repository root `./install.sh`
The script will check that every requirements are satisfied.

If you get message

`Basaar is successfully installed. To run server login to
vagrant box using 'vagrant ssh' command and run command
/home/vagrant/basaar/sites/basaar/manage.py runserver 0.0.0.0:8000
Source code is located in host machine /mnt/basaar, you can use that
with your favourite IDE. :-)`

then your development environment is setup correctly.

## Normal usage

If you already have installed the development environment, you can just cd to the repository where Vagrantfile is located and run command: vagrant up

Vagrant commands:
* vagrant up (starts the virtual environment)
* vagrant halt (stops the virtual environment)
* vagrant reload (restarts the virtual environment)

# Source code

After the installation, you can use favourite IDE/editor from your host machine. Source code is located on /mnt/basaar in your host machine.

# Git

After instalation, please change git settings from /mnt/basaar/.git to use your github credentials or SSH.

# Background information

Check this [documentation](https://github.com/koulutuksenpilvivayla/pilvivayla-development/wiki/Getting-started) to get more information about Vagrant and Ansible


 

