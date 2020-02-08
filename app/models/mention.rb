class Mention < ApplicationRecord
  belongs_to :shoutout
  belongs_to :user

  def length
    self.user.username.length
  end
end
