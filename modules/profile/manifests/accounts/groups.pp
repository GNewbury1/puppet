class profile::accounts::groups {

  group { 'test':
    ensure => present,
  }

  group { 'guy':
    ensure => present,
  }
}
