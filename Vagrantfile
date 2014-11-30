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

  config.vm.provision 'shell', inline: <<EOS
set -ex
sudo apt-get update
sudo env DEBIAN_FRONTEND=noninteractive apt-get install -y chef
EOS

  config.vm.provision "chef_solo" do |chef|
    chef.synced_folder_type = 'nfs'
    chef.add_recipe "sysctl::apply"
    chef.add_recipe "golang"
    chef.add_recipe "devvm"
    chef.add_recipe "elasticsearch"
    chef.add_recipe "elasticsearch::plugins"

    chef.json = {
      elasticsearch: {
        version: '1.4.0',
        bootstrap: {
          mlockall: false
        },
        plugins: {
          'karmi/elasticsearch-paramedic' => {}
        }
      },
      sysctl: {
        params: {
          kernel: {
            yama: {
              ptrace_scope: 0
            }
          }
        }
      }
    }
  end

  config.vm.network "forwarded_port",
                    guest: 9200,
                    host:  9200,
                    protocol: 'tcp',
                    host_ip: '127.0.0.1'
end
