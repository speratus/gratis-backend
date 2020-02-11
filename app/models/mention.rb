class Mention < ApplicationRecord
  belongs_to :shoutout
  belongs_to :user

  validates :user_id, :shoutout, presence: true

  def length
    self.user.username.length+1
  end
end
