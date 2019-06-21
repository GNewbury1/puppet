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

  user { 'guy':
    ensure     => present,
    home       => '/home/guy',
    shell      => '/bin/bash',
    managehome => 'true',
    gid        => 'guy',
    password   => '$1$qZ3ahaF7$DiBNXQYnSGmQlCa7ojCZo.',
  }
}
