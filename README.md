# Firewall (`pf`) Puppet Module for Boxen ![](https://travis-ci.org/nonrational/puppet-firewall)

Firewalls rock. OS X firewall configuration sucks.

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
