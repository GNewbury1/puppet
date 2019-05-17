class profile::nginx {
  include nginx

  nginx::resource::server { 'wiki.guynewbury.co.uk':
    www_root => '/var/www/wiki.guynewbury.co.uk'
  }
}