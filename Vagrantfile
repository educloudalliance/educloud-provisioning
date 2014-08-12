Vagrant.configure("2") do |config|
  config.vm.box      = "hashicorp/precise64"
  config.vm.network "public_network"
  config.vm.network :forwarded_port, guest: 8000, host: 8000, auto_correct: true
  config.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", 2048]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  config.vm.provision :ansible do |ansible|
    ansible.playbook = "provisioning/playbook.yml"

    ansible.host_key_checking = false
  end

  config.vm.synced_folder "/mnt/basaar", "/home/vagrant/basaar", id: "basaar"
end