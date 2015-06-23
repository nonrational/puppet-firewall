# (`pf`) Firewall Puppet Module for Boxen ![](https://travis-ci.org/nonrational/puppet-firewall.svg)

Firewalls -- and packet filters -- rock. Configuring the OSX Application Firewall configuration does not.

## Usage


Default:
```puppet
include firewall
```

Customized (**NOT IMPLEMENTED**)
```puppet
class { 'firewall':
  whitelisted_ports => [22,80]
}
```

## Required Puppet Modules

* `boxen`
