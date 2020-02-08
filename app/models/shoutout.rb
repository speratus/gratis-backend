class Shoutout < ApplicationRecord
  belongs_to :user

  has_many :mentions, dependent: :destroy

  has_many :shoutout_likes, dependent: :destroy

  has_many :comments, dependent: :destroy
end
