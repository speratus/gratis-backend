class Mention < ApplicationRecord
  belongs_to :shoutout
  belongs_to :user

  validates :user, :shoutout, presence: true

  def length
    self.user.username.length
  end
end
