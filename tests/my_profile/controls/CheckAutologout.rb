
# This cotrol makes sure that the STIG vuln-ID: 234812 is in full effect.
#
# Should return =>
#
#Profile:   tests from CheckAutologout.rb (tests from CheckAutologout.rb)
#Version:   (not specified)
#Target:    ssh://root@OpenSUSE-IP
#Target ID: 11ca306b-1528-51f7-9380-151de0af1952
#
#  ✔  autologout.sh: Verify autologout.sh file
#     ✔  File /etc/profile.d/autologout.sh is expected to exist
#     ✔  File /etc/profile.d/autologout.sh content is expected to match "TMOUT=900"
#     ✔  File /etc/profile.d/autologout.sh content is expected to match "readonly TMOUT"
#     ✔  File /etc/profile.d/autologout.sh content is expected to match "export TMOUT"
#
#
#Profile Summary: 1 successful control, 0 control failures, 0 controls skipped
#Test Summary: 4 successful, 0 failures, 0 skipped

control 'autologout.sh' do
    impact 0.7
    title 'Verify autologout.sh file'
    desc 'Ensure that the autologout.sh file exists and has the correct content'
  
    describe file('/etc/profile.d/autologout.sh') do
      it { should exist }
      its('content') { should match 'TMOUT=900' }
      its('content') { should match 'readonly TMOUT' }
      its('content') { should match 'export TMOUT' }
    end
  end
