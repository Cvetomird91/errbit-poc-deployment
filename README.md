Tested with Ansible 2.0.2.0 with local Redis installed for fact caching.

Ruby 2.1 is used on the web virtual machine, because the Vagrant Ubuntu 14.04 shipts with Puppet Agent 3.4 and
it doesn't work with Ruby >= 2.2 yet.

Todos:
- use Nginx to listen on port 80 and redirect on port 3000 where Puma is listening
