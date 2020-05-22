class UsersController < ApplicationController

    def new 
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        if User.find_by(username: @user.username) || User.find_by(email: @user.email)
            flash[:alert] = "Username or Email already taken." 
            render new_user_path
        elsif @user.save 
            session[:user_id] = @user.id
            redirect_to user_path(@user) 
        else 
            flash[:alert] = "Password Confirmation Does Not Match"
            render new_user_path
        end
    end

    def show 
        @user = helpers.current_user
    end

    def login 
        @user = helpers.current_user
        if helpers.logged_in?
            flash[:message] = "Please log out if you would like to log in as another user."
            redirect_to user_path(@user)
        end
    end

    

    private 

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation, :email, :pages_read)
    end
end
