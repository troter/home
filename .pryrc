# -*- coding: utf-8; mode: ruby -*-
require 'rubygems'

Pry.configure do |config|
  config.prompt_name = "#{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}"
end

Pry.config.hooks.add_hook(:before_session, :add_usual_dir_to_load_path) do
  dir = `pwd`.chomp
  %w(lib spec test).map { |d| "#{dir}/#{d}" }.each do |p|
    $: << p if File.exist?(p) && !$:.include?(p)
  end
end
