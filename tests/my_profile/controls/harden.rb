# controls/ssh.rb

control 'ssh-1.0' do
    impact 1.0
    title 'Check SSH'
    desc 'Check if SSH port is open'
    describe command('nc -zv 192.168.1.15 22') do
      its('stdout') { should match /succeeded/ }
    end
  end
