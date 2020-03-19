class ShoutoutLike < ApplicationRecord
  belongs_to :shoutout
  belongs_to :user

  validates :shoutout, user, presence: true
end
