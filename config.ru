require 'sinatra'
require 'sinatra/reloader' if development?
require 'tumblr_client'
require 'pry'
require 'mime/types'
load  'myapp.rb'

run Sinatra::Application
