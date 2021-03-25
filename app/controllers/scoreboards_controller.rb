class ScoreboardController < ApplicationController

    get '/' do 
        redirect_if_not_logged_in
        @scoreboards = current_user.scoreboards
        erb :"/scoreboards/index"
    end

    get '/scoreboards' do
        redirect to '/'
    end


    get "/scoreboards/new" do
        redirect_if_not_logged_in
        erb:'scoreboards/new'
    end

    post '/scoreboards/new' do
        redirect_if_not_logged_in
    scoreboard = current_user.scoreboards.build(params["scoreboard"])

    if scoreboard.save
        redirect "/scoreboards/#{scoreboard.id}"
    else
        flash[:error] = "#{scoreboard.errors.full_messages.join(", ")}"
        redirect "/scoreboards/new"
    end
    end

    get "/scoreboards/:id" do
        redirect_if_not_logged_in
        @scoreboard = Scoreboard.find_by_id(params[:id])
        erb :"/scoreboards/show"
    end

    get "/scoreboards/:id/edit" do
        redirect_if_not_logged_in
        redirect_if_not_authorized
        @scoreboard = Scoreboard.find_by_id(params[:id])
        erb :"/scoreboards/edit"
    end

    patch "/scoreboards/:id" do
        redirect_if_not_logged_in
        redirect_if_not_authorized
        @scoreboard = Scoreboard.find_by_id(params[:id])
        if @scoreboard.update(params["scoreboard"])
            redirect "/scoreboards/#{@scoreboard.id}"
        else
            flash[:error] = "#{scoreboard.errors.full_messages.join(", ")}"
            redirect "/scoreboards/#{@scoreboard.id}/edit"
        end
    end

    delete "/scoreboards/:id" do
        @scoreboard = Scoreboard.find_by_id(params[:id])
        redirect_if_not_logged_in
        redirect_if_not_authorized

        @scoreboard.destroy

        redirect "/"
    end

    private

    def redirect_if_not_authorized
        scoreboard = Scoreboard.find_by_id(params[:id])
        if scoreboard == nil || scoreboard.user_id != session["user_id"]
           redirect "/"
        end
    end

    def not_authorized
        @scoreboard = Scoreboard.find_by_id(params[:id])
        @scoreboard.user_id != session["user_id"]
    end


    

end