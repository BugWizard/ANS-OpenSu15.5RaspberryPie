
# My own InSpec control for SELinux config/etc
# This control will check if SELinux is set to enforcing and not disabled.

control 'check-selinux' do
  impact 1.0
  title 'Check if SELinux is in enforcing mode'
  desc 'SELinux should be in enforcing mode'
  
  describe command('getenforce') do
    its('stdout.strip') { should cmp 'Enforcing' }
  end
end


control 'check-selinux-config' do
  impact 1.0
  title 'Check SELinux configuration'
  desc 'SELinux should be in enforcing mode'

  describe file('/etc/selinux/config') do
    its('content') { should match /SELINUX=enforcing/ }
    its('content') { should match /SELINUXTYPE=targeted/ }
  end
end
