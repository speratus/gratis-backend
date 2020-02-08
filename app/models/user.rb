class User < ApplicationRecord
    has_secure_password

    has_one_attached :avatar
    has_one_attached :background

    #Checked. Both friendships and friends are functional
    has_many :friendships, foreign_key: :follower_id, dependent: :destroy
    has_many :friends, through: :friendships, source: :followee

    #Checked. Users can access mentions
    has_many :mentions, dependent: :destroy

    #Checked. Users can access group_members
    has_many :group_members
    #Checked. Users can access groups
    has_many :groups, through: :group_members, source: :friend_group

    #Checked. Users can access shoutouts
    has_many :shoutouts, dependent: :destroy
    #Checked. Users cna access shoutout likes
    has_many :shoutout_likes, dependent: :destroy
    
    #Checked. Users can access comments
    has_many :comments, dependent: :destroy
    #Checked. Users can access comment likes
    has_many :comment_likes, dependent: :destroy
end
