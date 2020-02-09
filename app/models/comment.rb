class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :shoutout

  has_many :comment_likes, dependent: :destroy

  validates :user, :shoutout, :content, presence: true
  validate :valid_length

  def valid_length
    if content.length > 256
      errors[:content] << 'The content must be less than 256 characters'
    end
  end
end
