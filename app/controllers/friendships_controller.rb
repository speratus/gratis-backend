class FriendshipsController < ApplicationController
  def create
    friendship = check_authorization(Friendship.new(friendship_params), current_user)

    if friendship.save
      render json: friendship
    else
      render json: {message: 'Creation of the friendship failed.', errors: friendship.errors.full_messages}
    end
  end

  def update
  end

  def delete
  end

  private

  def friendship_params
    params.require(:friendship).permit(:follower_id, :followee_id, :status)
  end
end
