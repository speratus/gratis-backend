class PostLike < ApplicationRecord
  belongs_to :shoutout
  belongs_to :user
end
