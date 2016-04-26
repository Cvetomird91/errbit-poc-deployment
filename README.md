Todos:
- remove hardcoded IPs in Vagrantfile for vm_db
- use puppetlabs-mongodb module to detect dynamically IP on vm_db box ($::ipaddress_eth1) and set MongoDB to listen on it
