require 'spec_helper'

describe 'firewall', :type => :class do

  Puppet::Util::Log.level = :debug
  Puppet::Util::Log.newdestination(:console)

  let(:boxen_home) { '/opt/boxen' }
  let(:config_dir) { "#{boxen_home}/config/pf" }
  let(:repo_dir)    { "#{boxen_home}/repo" }

  let(:facts) do
    default_test_facts.merge({
      :boxen_home    => boxen_home,
      :boxen_repodir => repo_dir,
    })
  end

  it { should contain_class('firewall') }
  it { should contain_file('/Library/LaunchDaemons/dev.pf.plist') }
  # it { should contain_file("#{config_dir}") }
  # it { should contain_file("#{config_dir}/pf.conf") }
  # it { should contain_file("#{config_dir}/pf.rules") }

end
