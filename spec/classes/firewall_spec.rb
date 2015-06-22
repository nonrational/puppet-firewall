require 'spec_helper'

describe 'firewall', :type => :class do

  # Puppet::Util::Log.level = :debug
  # Puppet::Util::Log.newdestination(:console)

  let(:facts) { default_test_facts }

  it { should contain_service('dev.pf') }
  it { should contain_class('firewall') }
  it { should contain_file('/Library/LaunchDaemons/dev.pf.plist') }
  it { should contain_file("/test/boxen/config/pf/pf.conf") }
  it { should contain_file("/test/boxen/config/pf/pf.rules") }
end
