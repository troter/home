#!/usr/bin/env ruby

require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'

  gem 'tty-command'
  gem 'thor'
end

require 'securerandom'
require 'thor'
require 'tty-command'

module TTY
  class Command
    module GitRunnable
      def git_path
        ENV["GIT"] || 'git'
      end

      def git(*argv, &block)
        run(git_path, *argv, &block)
      end

      def git_config
        Config.new(cmd: self)
      end

      class Config
        def initialize(cmd:)
          @cmd = cmd
        end

        def fetch(key, default)
          out, = @cmd.git('config', '--default', default, '--get', key)
          out.strip
        end
      end
    end
  end
end

module GitTmp
  class CLI < Thor
    desc "branch", "create temporary branch and switch"
    def branch
      prefix = cmd.git_config.fetch('tmp-branch.prefix', 'tmp')
      cmd.git("switch", "-c", generate_temporary_branch_name(prefix: prefix))
    end

    desc "merge COMMIT", "create temporary branch and merge COMMIT"
    def merge(commit)
      prefix = cmd.git_config.fetch('tmp-merge.prefix', 'tmp-merge')
      cmd.git("switch", "-c", generate_temporary_branch_name(prefix: prefix))
      cmd.git("git", "merge", commit)
    end

    no_commands do
      def generate_temporary_branch_name(prefix:)
        [prefix, SecureRandom.uuid].join("/")
      end

      def cmd
        @cmd ||= TTY::Command.new.tap { |cmd| cmd.extend TTY::Command::GitRunnable }
      end
    end
  end
end

if __FILE__ == $0
  GitTmp::CLI.start(ARGV)
end
