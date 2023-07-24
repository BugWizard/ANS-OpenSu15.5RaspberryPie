control 'os-01' do
    impact 1.0
    title 'Check if system packages are up to date'
    describe command('zypper lu') do
      its('stdout') { should match (/No updates found./) }
    end
  end
  