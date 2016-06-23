class FriendsController < ApplicationController
  def create

    end


  def index
    @friends = current_user.friends.joins(:profile).
      order("profiles.name asc")
  end

  def show
    @friend = Friend.find( params[:id] )
    @profile = Profile.where(user_id: @friend.id)
  end
end
