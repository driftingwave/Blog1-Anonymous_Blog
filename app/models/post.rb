class Post < ActiveRecord::Base
  validates_presence_of :title, :body
  has_and_belongs_to_many :tags
end
