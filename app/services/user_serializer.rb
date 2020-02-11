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
            mentions: user.mentions.map {|m| MentionSerializer.user_show(m)},
            groups: user.groups.map {|g| FriendGroupSerializer.basic_show(g)},
            friends: user.friends.map {|f| UserSerializer.basic_show(f)}
        }
    end

    def self.user_basic_show_all(users)
        users.map {|u| self.basic_show(u)}
    end

    def self.basic_show(user)
        {
            id: user.id,
            name: user.name,
            username: user.username,
            avatar: user.get_avatar,
            tagline: user.tagline,
            bio: user.bio
        }
    end

    def self.minimal_show(user)
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