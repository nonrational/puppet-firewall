# `pf` Firewall Puppet Module for Boxen

[![Build Status](https://travis-ci.org/nonrational/puppet-firewall.svg)](https://travis-ci.org/nonrational/puppet-firewall)

Firewalls and port-based packet filters rock. Configuring your Mac's Application Firewall configuration does not rock.

Including this module will configure your Mac's `pf` to

- block all incoming traffic except
    - basic service ports (`53 67 68 123 5353 5354`) on local subnets
    - icmp/ping (can be disabled via `allow_ping => false`)
    - ports you whitelist with `allow_inbound_ports`
- allow all outbound traffic
- allow all traffic on `lo0`

## Usage

Default:
```puppet
include firewall
```

Customized:
```puppet
class { 'firewall':
  allow_inbound_ports => [ 22, 31337 ]
}
```

## Required Puppet Modules

* `boxen`
* `stdlib`
