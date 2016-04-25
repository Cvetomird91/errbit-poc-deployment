exec { 'apt-update':
  command => '/usr/bin/apt-get update'
}

$packages = ['curl', 'git', 'mongodb-clients']
package { $packages:
  ensure => installed,
  provider => 'apt',
}

exec { 'get rvm gpg':
  path => '/usr/local/bin:/usr/bin:/home/vagrant/.rvm/bin',
  user => 'vagrant',
  command => 'gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3',
}

exec { 'install ruby 2.3.0':
  path => '/usr/local/bin:/bin:/usr/bin:/home/vagrant/.rvm/bin/',
  command => 'curl -sSL https://get.rvm.io | bash -s stable',
  user => 'vagrant',
  environment => ["HOME=/home/vagrant"]
}
