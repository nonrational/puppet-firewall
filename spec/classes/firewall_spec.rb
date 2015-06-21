require 'spec_helper'

describe 'firewall' do
  let(:title) { 'nginx' }

  it do
    should contain_class('firewall')
    should contain_file('/Library/LaunchDaemons/dev.pf.plist')
    # should contain_file("${boxen::config::configdir}/pf.conf")
    # should contain_file("${boxen::config::configdir}/pf.rules")
  end
end
