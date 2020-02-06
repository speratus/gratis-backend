class Mention < ApplicationRecord
  belongs_to :shoutout
  belongs_to :recipient, class_name: 'User'
end
