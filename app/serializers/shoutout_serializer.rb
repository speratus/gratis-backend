class ShoutoutSerializer < ActiveModel::Serializer
  attributes :id, :content, :visibility

  belongs_to :user
  has_many :comments
  has_many :mentions

  class UserSerializer < ActiveModel::Serializer
    attributes :id, :name, :username, :get_avatar
  end

  class CommentSerializer < ActiveModel::Serializer
    attributes :id, :content

    belongs_to :user
  end

  class MentionSerializer < ActiveModel::Serializer
    attributes :id

    belongs_to :user
  end
end
