# Configure pf
#
# Examples:
#   include firewall
#
#   class { 'firewall':
#     allow_inbound_ports => [ 443, 31337 ]
#   }
#
class firewall(
  $allow_inbound_ports = [],
  $allow_ping = true
) {
  include boxen::config

  $configdir   = "${boxen::config::configdir}/pf"
  $servicename = 'dev.pf'

  file { $configdir:
    ensure => directory
  }

  file { "${boxen::config::bindir}/pf-control.sh":
    content => template('firewall/pf-control.sh.erb'),
    group   => 'wheel',
    owner   => 'root',
    mode    => '755'
  }
  ->
  service { $servicename:
    ensure  => running
  }

  file { '/Library/LaunchDaemons/dev.pf.plist':
    content => template('firewall/dev.pf.plist.erb'),
    group   => 'wheel',
    owner   => 'root',
    notify  => Service[$servicename]
  }

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

  # exec { "${configdir}/emerging-PF-ALL.rules":
  #   command => "curl --create-dirs -o $configdir/emerging-PF-ALL.rules http://rules.emergingthreats.net/fwrules/emerging-PF-ALL.rules",
  #   creates => "$configdir/emerging-PF-ALL.rules",
  #   notify  => Service[$servicename],
  #   require => Package["curl"]
  # }
}
