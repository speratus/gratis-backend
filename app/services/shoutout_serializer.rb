class ShoutoutSerializer

    def self.shoutout_show(shoutout)
        {
            id: shoutout.id,
            content: shoutout.content,
            visibility: shoutout.visibility,
            user: UserSerializer.shoutout_show(shoutout.user),
            comments: shoutout.comments.map {|c| CommentSerializer.shoutout_show(c)},
            mentions: shoutout.mentions.map {|m| MentionSerializer.shoutout_show(m)}
        }
    end

    def self.user_show(shoutout)
        {
            id: shoutout.id,
            content: shoutout.content,
            mentions: shoutout.mentions.map {|m| MentionSerializer.shoutout_show(m)}
        }
    end

    def self.mention_show(shoutout)
        {
            id: shoutout.id,
            content: shoutout.content,
            user: UserSerializer.basic_show(shoutout.user)
        }
    end
end