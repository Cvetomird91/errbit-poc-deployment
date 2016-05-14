VAGRANT_API_VERSION = "2"

Vagrant.configure(VAGRANT_API_VERSION) do |setup|
  setup.vm.define "vm_db" do |vm_db|
    vm_db.vm.box = "ubuntu/trusty32"

    vm_db.vm.network "private_network", type: "dhcp"

    vm_db.vm.provider "virtualbox" do |vbox_db_settings|
      vbox_db_settings.name = "errbit_db"
      vbox_db_settings.memory = 512
      vbox_db_settings.cpus = 1
    end

    vm_db.vm.provision :shell, :path => "setup_db.sh"
    vm_db.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file = "vm_db.pp"
      puppet.options = "--verbose --debug"
    end

  end

  setup.vm.define "vm_web" do |vm_web|
    vm_web.vm.box = "ubuntu/trusty32"

    vm_web.vm.network "private_network", type: "dhcp"
    vm_web.vm.network "forwarded_port", guest:80, host: 8000

    vm_web.vm.provider "virtualbox" do |vbox_web_settings|
      vbox_web_settings.name = "errbit_web"
      vbox_web_settings.memory = "512"
      vbox_web_settings.cpus = 1
    end

    vm_web.vm.provision :shell, :path => "setup_web.sh"

    vm_web.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file = "vm_web.pp"
      puppet.options = "--verbose --debug"
    end

    vm_web.vm.provision "ansible" do |ansible|
      ansible.groups = {
         'vm_web' => ['vm_web'],
         'vm_db' => ['vm_db'],
      }
      ansible.playbook = 'playbook.yml'
      ansible.verbose = 'vvvv'
    end
  end

end
