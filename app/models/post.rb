class Post < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :description
  has_many :comments

end
