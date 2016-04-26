exec { 'apt-update':
  command => '/usr/bin/apt-get update'
}

$packages = ['curl', 'git', 'mongodb-clients']
package { $packages:
  ensure => installed,
  provider => 'apt',
}

class { '::rvm': }

rvm::system_user { vagrant: }

rvm_system_ruby {
  'ruby-2.3.0':
  ensure => 'present',
  default_use => true,
}
