class FriendshipsController < ApplicationController
  def create
    Friendship.where(user: current_user.id).destroy_all
    @friends = Friend.where("id <> ?", current_user.id).
      order("RANDOM()").limit(20).pluck(:id)
    current_user.friend_ids = @friends
  end

end
