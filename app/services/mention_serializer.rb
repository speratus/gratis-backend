class MentionSerializer

    def self.user_show(mention)
        {
            id: mention.id,
            shoutout: ShoutoutSerializer.mention_show(mention.shoutout)
        }
    end

    def self.shoutout_show(mention)
        {
            id: mention.id,
            user: UserSerializer.basic_show(mention.user)
        }
    end
end