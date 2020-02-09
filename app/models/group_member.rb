class GroupMember < ApplicationRecord
  belongs_to :user
  belongs_to :friend_group

  validates :user, :friend_group, presence: true
end
