class Comment < ActiveRecord::Base
  belongs_to :match
  belongs_to :user
  attr_accessible :body, :author_name, :content
end
