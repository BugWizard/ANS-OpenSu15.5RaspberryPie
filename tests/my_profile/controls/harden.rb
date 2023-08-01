# Check for SUSE operating system version

control "SRG-OS-000480-GPOS-00227" do
  impact 1.0
  title "Check if the SUSE operating system is a vendor-supported release."
  desc "The SUSE operating system must be a vendor-supported release. An unsupported release will not receive security updates, making it vulnerable to security issues."

  describe file('/etc/os-release') do
    its('content') { should match /NAME="openSUSE Leap"/ }
    its('content') { should match /VERSION="15.4"/ }
    its('content') { should_not match /VERSION="15.4"/ }
  end

  describe command('date +%Y%m%d') do
    its('stdout.to_i') { should be < 20280731 }
  end
end

# Check for implementation of Endpoint Security for Linux Threat Prevention tool
control "SRG-OS-000480-GPOS-00228" do
  impact 1.0
  title "Check if the SUSE operating system has implemented the Endpoint Security for Linux Threat Prevention tool."
  desc "The SUSE operating system must implement the Endpoint Security for Linux Threat Prevention tool. This tool can automatically take actions in response to malicious behavior, providing additional agility in reacting to network threats."

  describe command('zypper se -i -t package mcafeetp') do
    its('stdout') { should match /i\+ | mcafeetp/ }
  end

  describe processes('mfetpd') do 
    it { should exist }
  end
end