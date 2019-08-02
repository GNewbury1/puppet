class profile::accounts {

  include ::profile::accounts::groups

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
    groups     => ['guy','sudo']
  }

  ssh_authorized_key {'guy-laptop':
    ensure => present,
    name   => 'guy-laptop',
    user   => 'guy',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABgQDMCzvqed2OWAOp4spB2zCmyiOb8M8w7CBkvs9kXG2Z2QzCkYqjndW4JeCj5kVGqmphx2z0KjPeK7/pwWJYhBk1sGX9VwsgrE9XpSoTaEfsrpq2v6yEjL2zaj+0ERyacANLEGioP2sa2XFMak1PkeCIAsEEHORGOo+kYJfL1MVNvScEdsw5IQuIrnrOEvrovS1vxIymRY3QClZibgFGrGiS9mB+3pNT5pZKZkwLHp2fso9DoVW6TpSAZO4fTyfBAQ0i1j6MqCLvLjn9KsXkQ/A5cLk5Pot2YrraejiwXzP15sy0mA8RiwSAECruWIl13Vn3ke5v4pheT0ioTnl7hhc5bgdCVciT/bZPXelH7LgkBxkhmUKtsrGr4tnL81bcgjoegp4SLDTlihpy1ruQa002NmdpryKyURy/2O/DgA53ullbjlL5qAlLGYxq7s4irR7nIg5hMxFTIIVqcpYnKwpBFrOY4RKVPng1WsbSx0zzKNzWO2uVay5YpDhhdlTmrH0='
  }
}
