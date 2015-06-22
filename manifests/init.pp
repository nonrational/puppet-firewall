# Configure pf
#
# Examples:
#   include firewall
class firewall {

  $servicename = 'dev.pf'
  $configdir  = "${boxen::config::configdir}/pf"

  file { $configdir:
    ensure => directory
  }

  service { $servicename:
    ensure  => running
  }

  file { '/Library/LaunchDaemons/dev.pf.plist':
    content => template('firewall/dev.pf.plist.erb'),
    group   => 'wheel',
    owner   => 'root',
    notify  => Service[$servicename]
  }

  notify { "${configdir}/pf.conf": }
  notify { "${configdir}/pf.rules": }

  file { "${configdir}/pf.conf":
    content => template('firewall/pf.conf.erb'),
    notify  => Service[$servicename],
    require => File[$configdir]
  }

  file { "${configdir}/pf.rules":
    content => template('firewall/pf.rules.erb'),
    notify  => Service[$servicename],
    require => File[$configdir]
  }
}
