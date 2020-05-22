class UsersController < ApplicationController

    def new 
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        if @user.save 
            redirect_to user_path(@user) 
        else 
            flash[:alert] = "Password Confirmation Does Not Match"
            render new_user_path
        end
    end

    def show 
        @user = User.find_by(params[:id])
    end

    def login 

    end

    private 

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation, :email, :pages_read)
    end
end
