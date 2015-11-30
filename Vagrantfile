# -*- mode: ruby -*-
# vi: set ft=ruby :
ENV['VAGRANT_DEFAULT_PROVIDER'] ||= 'virtualbox'

Vagrant.configure(2) do |config|
  # Setup resource requirements
  config.vm.provider 'virtualbox' do |v|
    v.memory = 1024
    v.cpus = 1
  end

  config.vm.network 'forwarded_port', guest: 8888, host: 8888    # btsync
  config.vm.network 'forwarded_port', guest: 8081, host: 8081    # sickrage
  config.vm.network 'forwarded_port', guest: 5050, host: 5050    # couchpotato
  config.vm.network 'forwarded_port', guest: 8112, host: 8112    # deluge
  config.vm.network 'forwarded_port', guest: 58846, host: 58846  # torrent

  config.vm.hostname = 'multimedia-vm'

  # Ubuntu
  config.vm.box = 'ubuntu/trusty64'

  # Install latest docker
  config.vm.provision 'docker'

  # Setup the containers when the VM is first created
  config.vm.provision 'shell', path: 'vagrant/setup.sh'

  # Make sure the correct containers are running
  # every time we start the VM.
  config.vm.provision 'shell', run: 'always', path: 'vagrant/start.sh'
end
