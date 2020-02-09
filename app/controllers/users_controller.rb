class UsersController < ApplicationController
    # before_action :authenticated?, except: [:create]
    before_action :get_authorized_user, except: [:create, :index]

    def index
    end

    def show
        render json: UserSerializer.user_show(@user)
    end

    def create
        user = User.new(user_params)

        if user.save
            token = JWT.encode({'user_id': user.id}, ENV['SECRET'])
            render json: {token: token, user: UserSerializer.user_show(user)}
        else
            render json: {message: 'There was an error creating the user'}, status: 400
        end
    end

    def update
        if @user.update(user_params)
            render json: UserSerializer.user_show(@user)
        else
            render json: {message: 'There was an error updating the user'}, status: 400
        end
    end

    def delete
        @user.destroy

    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :password, :tagline, :email, :bio, :avatar)
    end

    def get_authorized_user
        user = User.find_by(id: params[:id])
        puts "++++++++++++ #{current_user}"
        # byebug
        @user = check_authorization(user, current_user)
    end
end
