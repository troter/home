# -*- mode: ruby; coding: utf-8; indent-tabs-mode: nil -*-
# .irbrc

require 'logger'

log = Logger.new(STDOUT)
log.level = Logger::DEBUG

IRB.conf[:SAVE_HISTORY] = 100000
IRB.conf[:IRB_NAME] = "#{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}"
