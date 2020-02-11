class Shoutout < ApplicationRecord
  belongs_to :user

  has_many :mentions, dependent: :destroy

  has_many :shoutout_likes, dependent: :destroy

  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :mentions

  validates :content, :user, :visibility, presence: true
  validates :visibility, inclusion: {in: %w(public friends)}
  validate :valid_length
  validate :has_at_least_one_mention


  check_perm 'shoutouts#update', 'shoutouts#delete' do |shoutout, user|
    shoutout.user == user
  end

  check_perm 'shoutouts#create' do |shoutout, user|
    !user.nil?
  end

  check_perm 'shoutouts#show' do |shoutout, user|
    shoutout.visibility == 'public' || shoutout.user == user || shoutout.user.friends.include?(user)
  end

  def valid_length
    if self.total_length > 256
      errors[:content] << 'Content (including mentions) must be less than 256 characters'
    end
  end

  def has_at_least_one_mention
    if self.mentions.length < 1
      errors[:mentions] << 'Must have at least one mention'
    end
  end

  def total_length
    mentions_lengths = self.mentions.map {|m| m.length}
    # puts "++++++++++++++++++#{self.mentions.length}"
    # puts "==================#{mentions_lengths}"
    mentions_len = mentions_lengths.reduce(:+)
    self.content.length + mentions_len
  end
end
