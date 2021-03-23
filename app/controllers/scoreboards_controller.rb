class ScoreboardController < ApplicationController

    get '/' do 
        redirect_if_not_logged_in
        @scoreboards = current_user.scoreboards
        erb :"/scoreboards/index"
    end

    get '/scoreboards' do
        redirect_if_not_logged_in
        erb :"/scoreboards/index"
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
        "Error"
    end
    end

    get "/scoreboards/:id" do
        redirect_if_not_logged_in
        @scoreboard = Scoreboard.find_by_id(params[:id])
        erb :"/scoreboards/show"
    end

    get "/scoreboards/:id/edit" do
        redirect_if_not_logged_in
        @scoreboard = Scoreboard.find_by_id(params[:id])
        erb :"/scoreboards/edit"
    end

    patch "/scoreboards/:id" do
        redirect_if_not_logged_in
        @scoreboard = Scoreboard.find_by_id(params[:id])
        if @scoreboard.update(params["scoreboard"])
            redirect "/scoreboards/#{@scoreboard.id}"
        else
            redirect "/scoreboards/#{@scoreboard.id}/edit"
        end
    end


    

end