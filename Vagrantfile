
Vagrant.configure("2") do |config|
  if Vagrant.has_plugin? "vagrant-vbguest"
    config.vbguest.no_install  = true
    config.vbguest.auto_update = false
    config.vbguest.no_remote   = true
  end

  config.vm.define :node1 do |node1|
    node1.vm.box = "bento/ubuntu-20.04"
    node1.vm.network :private_network, ip: "192.168.100.2"
    node1.vm.provision "shell", path: "script_node1.sh"
    node1.vm.hostname = "node1"
  end

  config.vm.define :node2 do |node2|
    node2.vm.box = "bento/ubuntu-20.04"
    node2.vm.network :private_network, ip: "192.168.100.3"
    node2.vm.provision "shell", path: "script_node2.sh"
    node2.vm.hostname = "node2"
  end
end