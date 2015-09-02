# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "puppetlabs/ubuntu-14.04-64-puppet"

  config.vm.define "lb01" do |lb01|
    lb01.vm.network :private_network, ip: "10.10.1.254"
    lb01.vm.hostname = "lb01"
  end

  config.vm.synced_folder "files", "/etc/puppetlabs/puppet/files"

  config.vm.provision :puppet, :options => ["--debug --trace --verbose"] do |puppet|
  #config.vm.provision :puppet do |puppet|
    puppet.environment = "production"
    puppet.environment_path  = "environments"
    puppet.options = ["--fileserverconfig=/vagrant/fileserver.conf"]
    puppet.hiera_config_path = "hiera.yaml"
  end
end
