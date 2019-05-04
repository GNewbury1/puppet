node default {
  include profile::base
}

node 'puppet-agent-ubuntu-2.lan' {
  include accounts
}
