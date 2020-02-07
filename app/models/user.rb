class User < ApplicationRecord
    has_secure_password

    has_one_attached :avatar, :background

    has_many :friendships
    has_many :friends, source: :friendshisps
end
