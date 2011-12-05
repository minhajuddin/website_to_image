require 'rubygems'
require 'bundler'

Bundler.require

set :env,  :production
disable :run

require File.join(File.dirname(__FILE__), 'app')

run WebsiteToImage::App
