$ruby_version = 'ruby-2.3.0'
$packages = ['curl', 'git', 'mongodb-clients']

exec { 'apt-update':
  command => '/usr/bin/apt-get update'
}

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

rvm_gem {
  'bundler':
    name => 'bundler',
    ruby_version => 'ruby-2.3.0',
    ensure       => latest,
    require      => Rvm_system_ruby['ruby-2.3.0'],
}

vcsrepo {'/home/vagrant/errbit':
  ensure => present,
  user => 'vagrant',
  provider => git,
  source => 'http://github.com/errbit/errbit/',
}
