# -*- mode: ruby -*-

task :default => :readme

desc 'Show readme'
task :readme do
  print File.open('README.md').read
end

namespace :prepare do
  desc "Prepare for cygwin"
  task :cygwin do
    puts <<-DOC.split(/\n/).map(&:lstrip)
      ## cygwin
      # full package install is the simplest way.
      # install ntemacs
    DOC
  end

  desc "Prepare for centos 6.x"
  task :centos do
    puts <<-DOC.split(/\n/).map(&:lstrip)
      ## centos 6.x
      # add repoforge.
      # ref: http://wiki.centos.org/AdditionalResources/Repositories/RPMForge
      wget http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm
      sudo rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt
      sudo rpm -K rpmforge-release-0.5.2-2.el6.rf.*.rpm
      sudo rpm -i rpmforge-release-0.5.2-2.el6.rf.*.rpm

      # upgrade system and install development tools:
      sudo yum upgrade
      sudo yum groupinstall 'Development tools' 'Additional Development'

      # install useful tools:
      sudo yum install screen zsh mercurial
    DOC
  end

  desc "Prepare for macosx"
  task :macosx do
    puts <<-DOC.split(/\n/).map(&:lstrip)
      ## macosx
      # install xcode comman line tools.
      # install homebrew
      ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
    DOC
  end
end

desc "prepare"
task :prepare => [
  'prepare:cygwin',
  'prepare:centos',
  'prepare:macosx',
]

namespace :brew do
  namespace :pythonbrew do
    desc "pythonbrew install"
    task :install do
      sh "curl -kL http://xrl.us/pythonbrewinstall | bash"
    end

    desc "pythonbrew update"
    task :update do
      sh "pythonbrew update"
    end
  end

  namespace :rvm do
    desc "rvm install"
    task :install do
      sh "curl -L https://get.rvm.io | bash -s stable"
    end

    desc "rvm update"
    task :update do
      sh "rvm get stable"
    end
  end

  namespace :perlbrew do
    desc "perlbrew install"
    task :install do
      sh "curl -kL http://install.perlbrew.pl | bash"
    end

    desc "perlbrew update"
    task :update do
      sh "perlbrew self-upgrade"
    end
  end

  namespace :nodebrew do
    desc "nodebrew install"
    task :install do
      sh "curl -L git.io/nodebrew | perl - setup"
    end

    desc "nodebrew update"
    task :update do
      sh "nodebrew selfupdate"
    end
  end

  namespace :gvm do
    desc "gvm install"
    task :install do
      sh "curl -s get.gvmtool.net | bash"
    end

    desc "gvm update"
    task :update do
      sh "gvm selfupdate"
    end
  end

  desc "brew install"
  task :install => [
    'brew:pythonbrew:install',
    'brew:rvm:install',
    'brew:perlbrew:install',
    'brew:nodebrew:install',
    'brew:gvm:install',
  ]

  desc "brew update"
  task :update => [
    'brew:pythonbrew:update',
    'brew:rvm:update',
    'brew:perlbrew:update',
    'brew:nodebrew:update',
    'brew:gvm:update',
  ]
end

desc "Brews"
task :brew do
  puts <<-DOC.split(/\n/).map(&:lstrip)
    - [rvm](https://github.com/wayneeseguin/rvm)
    - [pythonbrew](https://github.com/utahta/pythonbrew)
    - [perlbrew](https://github.com/gugod/App-perlbrew)
    - [nodebrew](https://github.com/hokaccha/nodebrew)
    - [gvm](http://gvmtool.net/)
  DOC
end
