require 'rubygems'
require 'sinatra'

set :env,  :production
disable :run

require File.join(File.dirname(__FILE__), 'app')

run WebsiteToImage::App
