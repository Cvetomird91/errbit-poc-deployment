$mongo_ip = $::ipaddress_eth1
class {'mongodb::server':
  bind_ip => $mongo_ip,
  set_parameter => 'textSearchEnabled=true',
}
