$:.unshift(File.expand_path(File.dirname(__FILE__)))

require 'pp'
require 'awesome_print'
require 'sinatra'
require 'logger'
require 'json'
require 'digest'
require 'dotenv'
require 'openssl'

require 'application'
require 'server'

Dotenv.load(
  File.join(App.root, ".env.#{App.env}"),
  File.join(App.root, '.env.local'),
  File.join(App.root, '.env')
)
