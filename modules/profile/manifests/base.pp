class profile::base (
  String $message
)
{
  case $::kernel {
    'Linux' : {
      file { 'info':
        path    => '/puppet.info',
        content => $message,
      }
    }
    'Windows' : {
		include profile::base::windows
    }
  }
}
