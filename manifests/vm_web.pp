include ::apt

$packages = [
  'curl',
  'git',
  'mongodb-clients',
  'ruby2.1',
  'ruby-switch',
  'ruby2.1-dev',
  'g++',
  'libxml2',
  'libxml2-dev',
  'libxslt-dev',
  'libcurl4-openssl-dev',
]

apt::ppa { 'ppa:brightbox/ruby-ng':
}

exec { 'apt-update':
  command => '/usr/bin/apt-get update'
}

package { $packages:
  ensure => installed,
  provider => 'apt',
}

exec {'use ruby2.3':
  command => 'sudo ruby-switch --set ruby2.1',
  path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:',
  require => [
    Package['ruby1.9.3'],
    Package['ruby1.9.3-dev'],
  ],
}

package { 'ruby1.9.3':
  ensure => 'purged',
  provider => 'apt',
}

package { 'ruby1.9.3-dev':
  ensure => 'purged',
  provider => 'apt',
}

vcsrepo {'/home/vagrant/errbit':
  ensure => present,
  user => 'vagrant',
  provider => git,
  source => 'http://github.com/errbit/errbit/',
}
