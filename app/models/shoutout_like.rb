class ShoutoutLike < ApplicationRecord
  belongs_to :shoutout
  belongs_to :user
end
