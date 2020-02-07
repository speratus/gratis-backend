class GroupMember < ApplicationRecord
  belongs_to :user
  belongs_to :friend_group
end
