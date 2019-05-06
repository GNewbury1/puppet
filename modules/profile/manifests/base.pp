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
		path   => '/puppet2.info',
		ensure => absent,
	  }
	  
	  file { 'info-three':
		path   => '/puppet3.info',
		ensure => absent,
	  }
    }
    'Windows' : {
		
		file { 'info':
			path 	=> 'C:\test.txt',
			content => 'This is managed by Puppet',
		}
    }
  }
}
