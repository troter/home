# -*- mode: ruby -*-

load '.mercurial/task.rake'

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

  brews = {
    pythonbrew: {
      homepage: 'https://github.com/utahta/pythonbrew',
      install: "curl -kL http://xrl.us/pythonbrewinstall | bash",
      update: "pythonbrew update"
    },
    rvm: {
      homepage: 'https://github.com/wayneeseguin/rvm',
      install: "curl -L https://get.rvm.io | bash -s stable",
      update: "rvm get stable"
    },
    perlbrew: {
      homepage: 'https://github.com/gugod/App-perlbrew',
      install: "curl -kL http://install.perlbrew.pl | bash",
      update: "perlbrew self-upgrade",
    },
    nodebrew: {
      homepage: 'https://github.com/hokaccha/nodebrew',
      install: "curl -L git.io/nodebrew | perl - setup",
      update: "nodebrew selfupdate",
    },
    gvm: {
      homepage: 'http://gvmtool.net/',
      install: "curl -s get.gvmtool.net | bash",
      update: "gvm selfupdate"
    }
  }

  brews.each do |name, defs|
    namespace name do
      desc "#{name} install"
      task :install do
        sh defs[:install]
      end

      desc "#{name} update"
      task :update do
        sh defs[:update]
      end
    end
  end

  desc "brew install"
  task :install => brews.map {|name, _| "brew:#{name}:install"}

  desc "brew update"
  task :update => brews.map {|name, _| "brew:#{name}:update"}

  task :homepage do
    brews.each do |name, defs|
      puts "[#{name}](#{defs[:homepage]})"
    end
  end
end

desc "Brews"
task :brew => 'brew:homepage'
