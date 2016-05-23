# -*- mode: ruby -*-
# vi: set ft=ruby :

# README
#
# Getting Started:
# 1. vagrant plugin install vagrant-hostmanager
# 2. vagrant up
# 3. vagrant ssh
#
# This should put you at the control host
#  with access, by name, to other vms
Vagrant.configure(2) do |config|
  config.hostmanager.enabled = true
  config.vm.box = "ubuntu/trusty64"
  config.vm.define "control", primary: true do |h|
    h.vm.network "private_network", ip: "192.168.135.10"
  end
  config.vm.provision "docker" do |d|
  d.build_image "/vagrant/docker"
  end
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbooks/playbook1.yml"
  end

end

