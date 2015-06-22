require 'rspec-puppet'

fixture_path = File.expand_path(File.join(__FILE__, '..', 'fixtures'))

$: << File.join(fixture_path, 'modules/module-data/lib')

RSpec.configure do |c|
  c.module_path = File.join(fixture_path, 'modules')
  c.manifest_dir = File.join(fixture_path, 'manifests')
end

def default_test_facts
  {
    :boxen_home                  => "/test/boxen",
    :boxen_srcdir                => "/test/boxen/src",
    :homebrew_root               => "/test/boxen/custom/homebrew",
    :boxen_user                  => "testuser",
    :macosx_productversion_major => "10.10",
    :osfamily                    => "Darwin",
  }
end
