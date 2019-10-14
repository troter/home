# -*- mode: ruby -*-

load '.mercurial/task.rake'

task :default => :readme

desc 'Show readme'
task :readme do
  print File.open('README.rst').read
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
  'prepare:macosx',
]

namespace :pipsi do
  desc 'install pipsi'
  task :install do
    sh 'curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | python'
  end
end
