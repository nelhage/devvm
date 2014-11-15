# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "box-cutter/ubuntu1404"

  config.ssh.forward_agent = true

  %w{vmware_fusion vmware_workstation}.each do |provider|
    config.vm.provider(provider) do |v|
      v.vmx["memsize"] = "2048"
      v.vmx["numvcpus"] = "2"
    end
  end

  config.vm.synced_folder "../", "/home/vagrant/code", type: 'nfs'
  config.vm.synced_folder ".", "/vagrant", disabled: true
end
