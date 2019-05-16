class accounts::groups {

  group { 'test':
    ensure => absent,
  }
}
