class User < ApplicationRecord
    has_secure_password

    has_one_attached :avatar
    has_one_attached :background

    has_many :friendships
    has_many :friends, source: :friendshisps

    has_many :mentions, foreign_key: :recipient_id

    has_many :group_members
    has_many :groups, through: :group_members
    
    has_many :shoutouts
end
