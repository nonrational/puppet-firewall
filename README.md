# `pf` Firewall Puppet Module for Boxen

[![Build Status](https://travis-ci.org/nonrational/puppet-firewall.svg)](https://travis-ci.org/nonrational/puppet-firewall)

Firewalls -- and packet filters -- rock. Configuring the OSX Application Firewall configuration does not rock

## Usage


Default:
```puppet
include firewall
```

~~Customized:~~ (**Not Implemented Yet**)
```puppet
class { 'firewall':
  whitelisted_ports => [22,80]
}
```

## Required Puppet Modules

* `boxen`
* `stdlib`
