class UsersController < ApplicationController

    get '/signup' do
        redirect_if_logged_in
        erb :'/users/new'
    end

    post '/signup' do

        redirect_if_logged_in

        user = User.new(params["user"])

        if user.save
            session["user_id"] = user.id
            redirect "/"
        else
            redirect "/signup"
        end
    end

    get "/users/:id" do
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
        erb :"/users/show"
    end

    get "/users" do
        redirect_if_not_logged_in
        @users = User.all
        erb :"/users/index"
    end
        

end