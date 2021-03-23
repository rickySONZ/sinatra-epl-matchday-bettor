class ApplicationController < Sinatra::Base

    configure do
        set :views, 'app/views'
        set :public_folder, 'public'
        enable :sessions
        set :session_secret, 'fnowiengowiegjpfoq4gn3ogi3o4bgo'
    end

    helpers do 
        def current_user
            @current_user ||= User.find_by_id(session["user_id"])
        end

        def logged_in?
            !!current_user
        end

        def redirect_if_not_logged_in
            redirect "/login" if !logged_in?
        end

        def redirect_if_logged_in
            redirect "/" if logged_in?
        end

    end

end