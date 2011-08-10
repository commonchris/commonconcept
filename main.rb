require 'rubygems'
require 'sinatra'
require 'data_mapper'

DataMapper::setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")

# models
require "#{Dir.pwd}/models/concoctive/dingus.rb"

# services
require "#{Dir.pwd}/services/dingus.rb"

# automatically create the text table
Dingus.auto_migrate! #unless Text.storage_exists?



