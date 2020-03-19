class CommentLike < ApplicationRecord
  belongs_to :comment
  belongs_to :user

  validates :comment, :user, presence: true
end
