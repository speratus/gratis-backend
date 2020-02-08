class User < ApplicationRecord
    has_secure_password

    has_one_attached :avatar
    has_one_attached :background

    has_many :friendships, foreign_key: :follower_id
    has_many :friends, through: :friendships

    #Checked. Users can access mentions
    has_many :mentions, dependent: :destroy

    has_many :group_members
    has_many :groups, through: :group_members

    #Checked. Users can access shoutouts
    has_many :shoutouts, dependent: :destroy
    has_many :shoutout_likes
    
    #Checked. Users can access comments
    has_many :comments, dependent: :destroy
    has_many :comment_likes
end
