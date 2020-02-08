class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :shoutout

  has_many :comment_likes, dependent: :destroy
end
