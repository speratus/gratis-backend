class ShoutoutsController < ApplicationController
  before_action :authenticated?
  before_action :get_authorized_user, except: [:index, :create]


  def index
  end

  def show
    render json: @shoutout
  end

  def update
    if @shoutout.update(shoutout_params)
      render json @shoutout
    else
      render json: {message: 'Invalid shoutout parameters'}, status: 400
    end
  end

  def create
    shoutout = check_authorization(Shoutout.new(shoutout_params), current_user)

    if shoutout.save
      render json: shoutout
    else
      render json: {message: 'there was an error in creating the shoutout.'}, status: 400
    end
  end

  def delete
    @shoutout.destroy
  end

  private

  def shoutout_params
    params.require(:shoutout).permit(:content, :visibility, :mentions: [:user_id])
  end

  def get_authorized_shoutout
    shoutout = Shoutout.find_by(id: params[:id])
    @shoutout = check_authorization(shoutout, current_user)
  end
end
