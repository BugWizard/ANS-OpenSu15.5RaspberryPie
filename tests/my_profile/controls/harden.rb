# Check for SUSE operating system version

control "SRG-OS-000480-GPOS-00227" do
  impact 1.0
  title "Check if the SUSE operating system is a vendor-supported release."
  desc "The SUSE operating system must be a vendor-supported release. An unsupported release will not receive security updates, making it vulnerable to security issues."

  describe file('/etc/os-release') do
    its('content') { should match /NAME="SLES"/ }
    its('content') { should match /VERSION="15"/ }
    its('content') { should_not match /VERSION="15-SP([0-9]+)"/ }
  end

  describe command('date +%Y%m%d') do
    its('stdout.to_i') { should be < 20280731 }
  end
end