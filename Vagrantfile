Vagrant.configure("2") do |setup|

  setup.vm.define "vm_db" do |vm_db|
    vm_db.vm.box = "ubuntu/trusty32"

		#vm_db.vm.network :public_network, ip: "192.168.10.16", :name => 'vboxnet0', :adapter => 2
	vm_db.vm.network "private_network", ip: "192.168.10.16"

   #vm_db.vm.provision :shell, :path => "setup_db.sh"
   #vm_db.vm.hostname = "vm-db"

	vm_db.vm.provider "virtualbox" do |vbox_db_settings|
	  vbox_db_settings.name = "mongo_db_ubuntu"
	  vbox_db_settings.memory = 512
	  vbox_db_settings.cpus = 1
	end

  	vm_db.vm.provision "puppet" do |puppet|
	  puppet.manifests_path = "manifests"
	  puppet.manifest_file = "vm_db.pp"
	  puppet.options = "--verbose --debug"
	end

  end

  setup.vm.define "vm_web" do |vm_web|

	vm_web.vm.box = "ubuntu/trusty32"
   #vm_web.vm.box_url = "https://github.com/holms/vagrant-centos7-box/releases/download/7.1.1503.001/CentOS-7.1.1503-x86_64-netboot.box"
   	vm_web.vm.synced_folder "/home/cvetomir/vagrant-box/shared-files", "/var/www"	
	vm_web.vm.network "private_network", ip: "192.168.16.10"
	#vm_web.vm.network :forwarded_port, guest: 3000, host: 3002

	  vm_web.vm.provider "virtualbox" do |vb|
	    vb.memory = "512"
   	    vb.cpus = 1
	  end

	  #specify path to private key
	 vm_web.ssh.private_key_path = "/home/cvetomir/.ssh/vagrant_private_key_web"

	vm_web.vm.provision :shell, :path => "setup_web.sh"

	vm_web.vm.provision "puppet" do |puppet|
	  puppet.manifests_path = "manifests"
	  puppet.manifest_file = "vm_web.pp"
	  puppet.options = "--verbose --debug"
	end

  end

	# Multi-machine environment
	# the configuration looks like a config inside a config

end
