class Friend < ActiveRecord::Base
  self.table_name = :users
  has_many :friendships
  has_one :profile, foreign_key: :user_id
end
