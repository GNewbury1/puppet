class profile::postgres {

  $db_name = lookup(profile::mysql::name)
  $db_user = lookup(profile::mysql::user)
  $db_pass = lookup(profile::mysql::pass)

  class { 'postgresql::server':
  }

  postgresql::server::db { $db_name:
    user     => $db_user,
    password => postgresql_pass1word($db_user, $db_pass),
  }

}