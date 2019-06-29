# Wordpress profile
class profile::wordpress {
  $db_host = lookup(profile::mysql::host)
  $db_pass = lookup(profile::mysql::pass)
  $db_name = lookup(profile::mysql::name)

  $wp_user = lookup(profile::wordpress::user)
  $wp_pass = lookup(profile::wordpress::pass)
  $wp_site = lookup(profile::wordpress::site)

  $wp_email = lookup(profile::wordpress::email)
  $wp_title = lookup(profile::wordpress::title)

  class { 'wordpress':
    settings => {
      $wp_site => {
        wproot        => '/var/www/root',
        owner         => 'wp',
        dbhost        => $db_host,
        dbname        => $db_name,
        dbpasswd      => $db_pass,
        wpadminuser   => $wp_user,
        wpadminpasswd => $wp_pass,
        wpadminemail  => $wp_email,
        wptitle       => $wp_title
      }
    }
  }

  user { 'wp':
    ensure     => present,
    home       => '/home/wp',
    shell      => '/bin/bash',
    managehome => 'true',
    groups     => ['sudo'],
    password   => '*',
  }
}