
require "bundler/setup"
Bundler.require

require 'sinatra/activerecord'
require "sinatra/activerecord/rake"

set :database, ({
    :adapter => "sqlite3",
    :database => "db/development.sqlite3"
})

require_all 'app'