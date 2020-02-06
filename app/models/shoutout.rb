class Shoutout < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :mentions
end
