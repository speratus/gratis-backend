class ApplicationController < ActionController::API

    def current_user
        token = request.headers['Access-Token']
        user_id = JWT.decode(token, ENV['SECRET'])[0]['user_id']
        @user = User.find_by(id: user_id)

        puts "=================#{@user}"

        @user
    end

    def authenticated?
        !!current_user
    end
end
