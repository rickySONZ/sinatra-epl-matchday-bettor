
require "bundler/setup"
Bundler.require
require 'dotenv/load'
require 'rack-flash'


set :database, ({
    :adapter => "sqlite3",
    :database => "db/development.sqlite3"
})

require_all 'app'