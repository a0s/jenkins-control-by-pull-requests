#!/usr/bin/env ruby
require File.expand_path(File.join(File.dirname(__FILE__), %w{environment}))
require 'pry'
Pry.config.quiet = true

require 'awesome_print'
AwesomePrint.pry!

binding.pry
