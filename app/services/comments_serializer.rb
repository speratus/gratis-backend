class CommentsSerializer

    def self.shoutout_show(comment)
        {
            id: comment.id,
            content: comment.content,
            user: UserSerializer.shoutout_show(comment.user)
        }
    end
end