require 'yaml'

dir = File.dirname(File.expand_path(__FILE__))

configValues = YAML.load_file("#{dir}/puphpet/config.yaml")
data = configValues['vagrantfile-local']


Vagrant.configure("2") do |config|

  # Attempt to detect whether we are on a Windows system.
  winos = (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
  
  # Check to see if we are going to be attempting NFS
  usenfs = !File.exist?('./NFS_block.txt')
 
  config.vm.box = "#{data['vm']['box']}"
  config.vm.box_url = "#{data['vm']['box_url']}"

  if data['vm']['hostname'].to_s != ''
    config.vm.hostname = "#{data['vm']['hostname']}"
  end
  
  if data['vm']['network']['private_network'].to_s != ''
    config.vm.network "private_network", ip: "#{data['vm']['network']['private_network']}"
  end

  config.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true

  if !winos
    config.vm.synced_folder "./www", "/var/www", id: "webroot", :nfs => usenfs
  end

  config.vm.usable_port_range = (2200..2250)
  if !data['vm']['provider']['virtualbox'].empty?
      config.vm.provider :virtualbox do |virtualbox|
        data['vm']['provider']['virtualbox']['modifyvm'].each do |key, value|
          if key == "natdnshostresolver1"
            value = value ? "on" : "off"
          end
          virtualbox.customize ["modifyvm", :id, "--#{key}", "#{value}"]
        end
      end
  end
  
  config.vm.provision :shell, :path => "puphpet/shell/initial-setup.sh"
  config.vm.provision :shell, :path => "puphpet/shell/update-puppet.sh"
  config.vm.provision :shell, :path => "puphpet/shell/librarian-puppet-vagrant.sh"
  config.vm.provision :puppet do |puppet|
    puppet.facter = {
      "ssh_username" => "vagrant"
    }

    puppet.manifests_path = "puphpet/puppet/manifests"
    puppet.options = ["--verbose", "--hiera_config /vagrant/puphpet/puppet/hiera.yaml", "--parser future"]
  end

  config.vm.provision :shell, :path => "puphpet/shell/execute-files.sh"

  config.ssh.username = "vagrant"

  config.ssh.shell = "bash -l"

  config.ssh.keep_alive = true
  config.ssh.forward_agent = false
  config.ssh.forward_x11 = false
  config.vagrant.host = :detect
end



