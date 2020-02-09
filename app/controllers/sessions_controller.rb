class SessionsController < ApplicationController

  def create
    user = User.find_by(username: params[:username])
    
    if user && user.authenticate(params[:password])
      token = JWT.encode({user_id: user.id}, ENV['SECRET'])
      # byebug
      render json: {:token => token}
    else
      render json: {message: 'Incorrect username or password'}
    end
  end

  def delete
  end
end
