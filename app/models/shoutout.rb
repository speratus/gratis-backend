class Shoutout < ApplicationRecord
  belongs_to :user

  has_many :mentions, dependent: :destroy

  has_many :shoutout_likes, dependent: :destroy

  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :mentions

  check_perm 'shoutouts#update', 'shoutouts#delete' do |shoutout, user|
    shoutout.user == user
  end

  check_perm 'shoutouts#create' do |shoutout, user|
    !user.nil?
  end

  check_perm 'shoutouts#show' do |shoutout, user|
    shoutout.visibility == 'public' || shoutout.user.friends.include?(user)
  end
end
