class profile::accounts {
  
  include profile::accounts::groups

  user { 'test' :
    ensure     => present,
    home       => '/home/test',
    shell      => '/bin/bash',
    managehome => 'true',
    gid        => 'test',
    password   => '*'
  }
}
