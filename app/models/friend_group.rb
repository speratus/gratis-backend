class FriendGroup < ApplicationRecord

    has_many :group_members, dependent: :destroy
    has_many :members, through: :group_members, source: :user

    validates :name, :description: presence: true

end
