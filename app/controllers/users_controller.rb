class UsersController < ApplicationController

    def new 
        @user = User.new
    end

    def create 
        @user = User.build(user_params)
    end

    def show 

    end

    def login 

    end

    private 

    def user_params
        params.require(:user).permit(:username, :password, :email, :pages_read)
    end
end
