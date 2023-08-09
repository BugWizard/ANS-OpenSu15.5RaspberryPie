


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
