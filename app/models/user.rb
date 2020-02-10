class User < ApplicationRecord
    include AttachmentGetter
    has_secure_password

    has_one_attached :avatar
    has_one_attached :background

    #Checked. Both friendships and friends are functional
    has_many :friendships, foreign_key: :follower_id, dependent: :destroy
    has_many :friends, through: :friendships, source: :followee

    #Checked. Users can access mentions
    has_many :mentions, dependent: :destroy

    #Checked. Users can access group_members
    has_many :group_members, dependent: :destroy
    #Checked. Users can access groups
    has_many :groups, through: :group_members, source: :friend_group

    #Checked. Users can access shoutouts
    has_many :shoutouts, dependent: :destroy
    #Checked. Users can access shoutout likes
    has_many :shoutout_likes, dependent: :destroy
    
    #Checked. Users can access comments
    has_many :comments, dependent: :destroy
    #Checked. Users can access comment likes
    has_many :comment_likes, dependent: :destroy

    validates :email, :username, :name, :password, presence: true
    validates :email, :username, uniqueness: true

    check_perm 'users#show', 'users#update', 'users#delete' do |attempted_user, current_user|
        attempted_user == current_user
    end

    check_perm 'users#profile' do |nothing, user|
        !user.nil?
    end

    def get_avatar
        get_attachment(self.avatar)
    end
end
