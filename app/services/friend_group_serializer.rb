class FriendGroupSerializer


    def self.basic_show(group)
        {
            id: group.id,
            name: group.name,
            description: group.description
        }
    end
end