class role::webserver {
  include profile::base
  include profile::accounts
  include profile::mysql
  include profile::wordpress
}