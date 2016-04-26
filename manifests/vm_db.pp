$module_stdlib = 'puppetlabs-stdlib'

exec {'puppet-stdlib':
    command => "puppet module install -i /etc/puppet/modules ${module_stdlib}",
    unless  => "puppet module list | grep ${module_stdlib}",
    path    => ['/bin', '/opt/puppetlabs/bin', '/usr/bin/', '/usr/local/bin']
}

class mongo {

  # $mongo_ip = $::ipaddress_eth1
  $mongo_ip = "192.168.10.16"

  exec { 'apt-update':
    command => '/usr/bin/apt-get update',
  }

  # I didn't install all the mongodb* packages, just the ones I assumed are needed
  $packages = ['mongodb', 'mongodb-server']
  package { $packages:
    ensure => installed,
    provider => 'apt',
  }

  file_line {'enable text search':
    path => '/etc/mongodb.conf',
    line => 'setParameter=textSearchEnabled=true',
  }

  file_line {'change_mongo_ip':
    path => '/etc/mongodb.conf',
    line => "bind_ip=$mongo_ip",
    match => "^bind_ip.*",
  }

  service {'mongodb':
    ensure => running,
    enable => true,
  }

  exec {'restart mongo':
    command => '/usr/sbin/service mongodb restart',
  }

}

include mongo
