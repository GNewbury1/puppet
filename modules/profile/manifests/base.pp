class profile::base {
  case $::kernel {
    'Linux' : {
      file { 'info':
        path    => '/puppet.info',
        content => 'Managed with puppet base class for Linux',
      }
    }
    'Windows' : {
    }
  }
}
