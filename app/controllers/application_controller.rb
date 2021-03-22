class ApplicationController < Sinatra::Base

    configure do
        set :views, 'app/views'
        set :public_folder, 'public'
        enable :sessions
        set :session_secret, 'fnowiengowiegjpfoq4gn3ogi3o4bgo'
    end

    get '/' do 
        erb :index
    end

    



end