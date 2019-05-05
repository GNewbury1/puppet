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
	  
	  file { 'info-two':
		path 	=> '/puppet2.info',
		content => 'Hello',
	  }
    }
    'Windows' : {
		include profile::base::windows
    }
  }
}
