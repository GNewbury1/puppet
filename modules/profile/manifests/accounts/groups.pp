class profile::accounts::groups {

  group { 'test':
    ensure => absent,
  }
}
