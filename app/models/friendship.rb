class Friendship < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followee, class_name: 'User'

  validates :follower, :followee, :status, presence: true
  validates :status, inclusion: {in: %w(following friends)}
  validate :no_matches

  check_perm "friendships#create" do |empty, user|
    !user.nil?
  end

  private

  def no_matches
    if Friendship.find_by(follower_id: self.follower_id, followee_id: self.followee_id)
      errors[:follower_id] << 'You are already friends with that person'
    end
  end
end
