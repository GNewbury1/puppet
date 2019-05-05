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
	  
	  file { 'info-three':
		path 	=> '/puppet3.info',
		content => 'This is boring now',
	  }
    }
    'Windows' : {
		include profile::base::windows
    }
  }
}
