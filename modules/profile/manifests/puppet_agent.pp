class profiles::puppet_agent {
  class { '::puppet':
    pluginsync   => true,
    runmode      => 'service',
    agent        => true,
    puppetmaster => 'puppet-master.lan'
    ca_server    => 'pupper-master.lan'
  }
}
