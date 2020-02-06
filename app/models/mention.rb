class Mention < ApplicationRecord
  belongs_to :post
  belongs_to :recipient, class_name: 'User'
end
