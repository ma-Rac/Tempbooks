class Friend < ActiveRecord::Base
  self.table_name = :users
  has_many :friendships
end
