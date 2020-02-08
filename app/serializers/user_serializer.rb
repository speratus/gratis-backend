class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :email, :bio, :get_avatar

  has_many :shoutouts
  has_many :mentions

  class ShoutoutSerializer < ActiveModel::Serializer
    attributes :id, :content
  end

  class MentionSerializer < ActiveModel::Serializer
    attributes :id

    belongs_to :shoutout

    class ShoutoutSerializer < ActiveModel::Serializer
      attributes :id, :content

      belongs_to :user

      class UserSerializer < ActiveModel::UserSerializer
        attributes :id, :name, :username
      end
    end
  end
end
