# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  (0..2).each do |i|
    config.vm.define "controller-#{i}" do |node|
    
      node.vm.box               = "debian/bookworm64"
      node.vm.hostname          = "controller-#{i}"

      #node.vm.network "public_network"
      node.vm.network "private_network", ip: "10.240.0.1#{i}", name: "vboxnet6"

      node.vm.provider :virtualbox do |v|
        v.name    = "controller-#{i}"
        v.memory  = 1024
        v.cpus    =  1
      end
      node.vm.provision "shell", path: "scripts/deploy.sh"
    end

  end

end
