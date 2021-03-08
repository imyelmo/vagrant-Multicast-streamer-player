# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ProfessorManhattan/Base-Ubuntu-Desktop"
# config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", 256]
    v.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
  end

  config.vm.define :streamer do |streamer_config|
    streamer_config.vm.hostname = 'streamer'
    streamer_config.vm.network :private_network, ip: "10.1.1.2"
    streamer_config.ssh.forward_agent = true
	  streamer_config.ssh.forward_x11 = true
    streamer_config.vm.provision :shell, :path => "streamer.sh"
    streamer_config.vm.provider :virtualbox do |vb|
     	vb.customize ['modifyvm', :id, '--nictrace2', 'on']
     	vb.customize ['modifyvm', :id, '--nictracefile2', 'streamer_trace2.pcap'] 
    end  
  end

  config.vm.define :player do |player_config|
    player_config.vm.hostname = 'player'
    player_config.vm.network :private_network, ip: "10.1.2.2"
    player_config.ssh.forward_agent = true
    player_config.ssh.forward_x11 = true
    player_config.vm.provision :shell, :path => "player.sh"
    player_config.vm.provider :virtualbox do |vb|
      vb.customize ['modifyvm', :id, '--nictrace2', 'on']
      vb.customize ['modifyvm', :id, '--nictracefile2', 'player_trace2.pcap'] 
    end  
  end

end