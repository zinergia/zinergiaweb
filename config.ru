# config.ru

path = File.expand_path "../", __FILE__

require 'rubygems'
require 'sinatra'
require "#{path}/zinweb"

run Sinatra::Application