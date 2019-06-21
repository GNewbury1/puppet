class role::bitbucket {

  include ::profile::base
  include ::profile::accounts
  include ::profile::postgres
  include ::profile::stash

}