include ::apt

$packages = ['curl', 'git', 'mongodb-clients', 'ruby2.3', 'ruby-switch']

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
  command => 'sudo ruby-switch --set ruby2.3',
  path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games',
}

package { 'ruby1.9.3':
  ensure => 'purged',
}

package { 'ruby1.9.3-dev':
  ensure => 'purged',
}

vcsrepo {'/home/vagrant/errbit':
  ensure => present,
  user => 'vagrant',
  provider => git,
  source => 'http://github.com/errbit/errbit/',
}
