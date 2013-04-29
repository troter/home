# -*- mode: ruby -*-

# https://github.com/mitchellh/vagrant
# https://github.com/mitchellh/vagrant-aws/
# http://d.hatena.ne.jp/naoya/20130315/1363340698

# # sudo fix
# edit sudo and disable follow options
# requiretty
# !visiblepw
#
# ref: https://github.com/mitchellh/vagrant-aws/issues/10
# ref: https://github.com/mitchellh/vagrant/issues/1482

def set_defaults(aws, override)
  aws.access_key_id = ENV['AWS_ACCESS_KEY_ID']
  aws.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
  aws.keypair_name = ENV['AWS_KEYPAIR_NAME']
  aws.instance_type = 't1.micro'
  aws.region = 'ap-northeast-1'
  aws.security_groups = ['default']
  override.ssh.private_key_path = ENV['AWS_PRIVATE_KEY_PATH']
end

# VAGRANT_LOG=debug vagrant up <NAME> --provider=aws
Vagrant.configure("2") do |config|
  config.vm.box = "dummy"

  config.vm.define :ubuntu do |c|
    c.vm.provider :aws do |aws, override|
      set_defaults(aws, override)
      aws.ami = 'ami-f8a813f9' # ubuntu 12.10 x86_64
      override.ssh.username = 'ubuntu'
    end
  end

  config.vm.define :centos do |c|
    c.vm.provider :aws do |aws, override|
      set_defaults(aws, override)
      aws.ami = 'ami-6244fa63' # CentOS 6.3 x86_64 Release Media
      override.ssh.username = 'root'
    end
  end

  config.vm.define :amazon do |c|
    c.vm.provider :aws do |aws, override|
      set_defaults(aws, override)
      aws.ami = 'ami-173fbf16' # amazon linux 2013.03 x86_64
      override.ssh.username = 'ec2-user'
    end
  end

  config.vm.define :suse do |c|
    c.vm.provider :aws do |aws, override|
      set_defaults(aws, override)
      aws.ami = 'ami-e6d263e7' # SUSE Linux Enterprise Server 11
      override.ssh.username = 'root'
    end
  end

  config.vm.define :arch do |c|
    c.vm.provider :aws do |aws, override|
      set_defaults(aws, override)
      # http://www.uplinklabs.net/projects/arch-linux-on-ec2/
      aws.ami = 'ami-caac21cb' # arch linux x86_64
      override.ssh.username = 'root'
    end
  end

  config.vm.define :omnios do |c|
    c.vm.provider :aws do |aws, override|
      set_defaults(aws, override)
      # http://www.uplinklabs.net/projects/arch-linux-on-ec2/
      aws.ami = 'ami-e855ebe9' # OmniOS stable r151004 x86_64
      override.ssh.username = 'root'
    end
  end

  # # http://wiki.opscode.com/display/chef/Installing+Omnibus+Chef+Client+on+Linux+and+Mac
  # config.vm.provision :shell, inline: <<-INLINE
  #   sudo true && curl -L https://www.opscode.com/chef/install.sh | sudo bash
  # INLINE
  # config.vm.provision :chef_solo do |chef|
  #   chef.add_recipe 'sandbox'
  # end
end
