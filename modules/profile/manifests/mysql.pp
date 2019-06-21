class profile::mysql {

  include ::mysql::server

  $db_name = lookup(profile::mysql::name)
  $db_user = lookup(profile::mysql::user)
  $db_pass = lookup(profile::mysql::pass)
  $db_host = lookup(profile::mysql::host)
  $db_perm = lookup(profile::mysql::perm)

  mysql::db { $db_name:
    user     => $db_user,
    password => $db_pass,
    host     => $db_host,
    grant    => $db_perm,
  }
}