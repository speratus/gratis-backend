class UserSerializer

    def self.user_show(user)
        {
            id: user.id,
            name: user.name,
            username: user.username,
            email: user.email,
            bio: user.bio,
            avatar: user.get_avatar,
            shoutouts: user.shoutouts.map {|s| ShoutoutSerializer.user_show(s)},
            mentions: user.mentions.map {|m| MentionSerializer.user_show(m)}
        }
    end

    def self.basic_show(user)
        {
            id: user.id,
            name: user.name,
            username: user.username,
            avatar: user.get_avatar
        }
    end

    def self.shoutout_show(user)
        {
            id: user.id,
            name: user.name,
            username: user.username,
            avatar: user.get_avatar
        }
    end
end