require 'spec_helper'

describe 'firewall' do
  it do
    should contain_file('/Library/LaunchDaemons/dev.pf.plist')
    should contain_file("${boxen::config::configdir}/pf.conf")
    should contain_file("${boxen::config::configdir}/pf.rules")
  end
end
