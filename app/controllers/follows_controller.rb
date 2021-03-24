class FollowsController < ApplicationController


    post '/users/:id/follow' do
        followuser = User.find_by_id(params[:id])

        if !current_user.following.include?(followuser)
        current_user.following << followuser
        end
        if !followuser.followers.include?(current_user)
        followuser.followers << current_user
        end
    
        redirect '/users'
    end


    helpers do

        def following?
            user = User.find_by_id(params[:id])
            current_user.following.include?(user)
        end

    end

end

