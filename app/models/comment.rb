class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :shoutout

  has_many :comment_likes
end
