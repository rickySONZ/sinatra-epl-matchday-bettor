class SessionsController < ApplicationController


    get '/login' do
        redirect_if_logged_in
        erb :'sessions/new'
    end

    post "/login" do
        redirect_if_logged_in

        user = User.find_by(email: params["user"]["email"])

        if user && user.authenticate(params["user"]["password"])
            session["user_id"] = user.id
            redirect "/"
        else
            
            redirect "/login"
        end
    end

    post '/logout' do
        session.delete("user_id")
        redirect "/login"
    end


end