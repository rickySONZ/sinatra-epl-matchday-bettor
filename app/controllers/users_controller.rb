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
            flash[:error] = "#{user.errors.full_messages.join(", ")}"
            redirect "/signup"
        end
    end

    get "/users" do
        redirect_if_not_logged_in
        @users = User.all
        erb :"/users/index"
    end

    get "/users/:id" do
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
        erb :"/users/show"
    end

    helpers do 
        def following?
            user = User.find_by_id(params[:id])
            current_user.following.include?(user)
        end
    end
        

end