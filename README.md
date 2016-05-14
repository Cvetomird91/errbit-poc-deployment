Proof of concept deployment of the Airbreak API compatible error catcher Errbit. It uses Ruby on Rails. The setup makes use of Vagrant with VirtualBox for the boxes' setup, Puppet for provisioning of the needed services and Ansible for the application's deployment.

Tested with Ansible 2.0.2.0 with local Redis installed for fact caching.

Ruby 2.1 is used on the web virtual machine, because the Vagrant Ubuntu 14.04 shipts with Puppet Agent 3.4 and
it doesn't work with Ruby >= 2.2 yet.
