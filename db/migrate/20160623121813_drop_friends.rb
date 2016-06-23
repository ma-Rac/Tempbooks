class DropFriends < ActiveRecord::Migration
  def change
    remove_foreign_key "friendships", "friends"
    drop_table :friends
  end
end
