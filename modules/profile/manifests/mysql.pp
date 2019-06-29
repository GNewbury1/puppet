class profile::mysql {


  $db_name = lookup(profile::mysql::name)
  $db_user = lookup(profile::mysql::user)
  $db_pass = lookup(profile::mysql::pass)
  $db_host = lookup(profile::mysql::host)
  $db_perm = lookup(profile::mysql::perm)
  $db_fulluser = lookup(profile::mysql::fulluser)

  class { '::mysql::server':
    databases => {
      "${db_name}" => {
        ensure  => 'present',
        charset => 'utf8',
      },
    },

    users => {
      $db_fulluser => {
        ensure        => 'present',
        password_hash => $db_pass
      },
    },

    grants => {
      "${db_fulluser}/${db_name}.*" => {
        ensure     => 'present',
        privileges => $db_perm,
        table      => "${db_name}.*",
        user       => $db_fulluser
      }
    }
  }
}