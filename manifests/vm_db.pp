$mongo_ip = $::ipaddress_eth1
class {'mongodb::server':
  bind_ip => $mongo_ip,
  set_parameter => 'textSearchEnabled=true',
}

exec {'set mongodb lib permissions':
  command => 'sudo chown -R mongodb:mongodb /var/lib/mongodb',
  path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:',
}
