class Shoutout < ApplicationRecord
  belongs_to :user
  has_many :mentions
end
