# Wordpress profile
class profile::wordpress {

  $db_host = lookup(profile::mysql::host)
  $db_pass = lookup(profile::mysql::pass)
  $db_name = lookup(profile::mysql::name)
  $db_user = lookup(profile::mysql::user)

  $wp_user = lookup(profile::wordpress::user)
  $wp_pass = lookup(profile::wordpress::pass)
  $wp_site = lookup(profile::wordpress::site)

  $wp_email = lookup(profile::wordpress::email)
  $wp_title = lookup(profile::wordpress::title)

  $db_pass_enc = lookup(profile::mysql::pass_enc)

  class { 'wordpress':
    settings => {
      $wp_site => {
        wproot        => '/var/www/root',
        owner         => 'wp',
        dbhost        => $db_host,
        dbname        => $db_name,
        dbuser        => $db_user,
        dbpasswd      => $db_pass_enc,
        wpadminuser   => $wp_user,
        wpadminpasswd => $wp_pass,
        wpadminemail  => $wp_email,
        wptitle       => $wp_title,
        wpresources   => {
          theme => [
            { name => 'consulting', },
          ]
        },
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