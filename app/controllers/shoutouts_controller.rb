class ShoutoutsController < ApplicationController
  # before_action :authenticated?
  before_action :get_authorized_shoutout, except: [:index, :create]


  def index
  end

  def show
    render json: ShoutoutSerializer.shoutout_show(@shoutout)
  end

  def update
    if @shoutout.update(shoutout_params)
      render json: ShoutoutSerializer.mention_show(@shoutout)
    else
      render json: {message: 'Invalid shoutout parameters'}, status: 400
    end
  end

  def create
    shoutout = check_authorization(Shoutout.new(shoutout_params), current_user)
    # puts "==========#{shoutout_params}"
    if shoutout.save
      render json: ShoutoutSerializer.mention_show(shoutout)
    else
      render json: {
          message: 'there was an error in creating the shoutout.',
          errors: shoutout.errors.full_messages
        }, status: 400
    end
  end

  def destroy
    @shoutout.destroy
    render json: {message: 'successfully deleted shoutout', shoutout: @shoutout}
  end

  private

  def shoutout_params
    params.require(:shoutout).permit(:content, :visibility, :user_id, mentions_attributes: :user_id)
  end

  def get_authorized_shoutout
    shoutout = Shoutout.find_by(id: params[:id])
    if shoutout
      @shoutout = check_authorization(shoutout, current_user)
    else
      render json: {message: 'That shoutout does not exist'}, status: 404
    end
  end
end
