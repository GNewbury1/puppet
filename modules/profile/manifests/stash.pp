class profile::stash {

  $db_pass = lookup(profile::mysql::pass)
  $db_host = lookup(profile::mysql::host)

  class { 'stash':
    version    => '4.14',
    jvm_xms    => '512M',
    jvm_xmx    => '512M',
    dburl      => $db_host,
    dbpassword => $db_pass,
    javahome   => '/opt/java'
  }

  class { 'java':
    distribution => 'jre',

  }

}