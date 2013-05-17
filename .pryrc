# -*- coding: utf-8; mode: ruby -*-
Pry.config.command_prefix = "%"
Pry.config.prompt = [
  proc {|target_self, nest_level, pry|
    nested = (nest_level.zero?) ? '' : ":#{nest_level}"
    "[#{pry.input_array.size}] #{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}(#{Pry.view_clip(target_self)})#{nested}> "
  },
  proc {|target_self, nest_level, pry|
    nested = (nest_level.zero?) ?  '' : ":#{nest_level}"
    "[#{pry.input_array.size}] #{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}(#{Pry.view_clip(target_self)})#{nested}* "
  }
]

Pry.config.hooks.add_hook(:before_session, :add_usual_dir_to_load_path) do
  dir = `pwd`.chomp
  %w(lib spec test).map { |d| "#{dir}/#{d}" }.each do |p|
    $: << p if File.exist?(p) && !$:.include?(p)
  end
end
