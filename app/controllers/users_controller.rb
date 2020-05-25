class UsersController < ApplicationController

    def new 
        if logged_in? 
            flash[:message] = "You must log out if you would like to make a new account."
            redirect_to user_path(current_user)
        end
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
        @user = current_user
    end

    def login 
        @user = current_user
        if @user
            flash[:message] = "You are already signed in! You must log out before logging in to another account."
            redirect_to user_path(@user)
        elsif params[:user]
            @user = User.find_by(username: params[:user][:username])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            @user = User.new
        end
    end

    def logout 
        session.clear
        redirect_to users_login_path
    end

    private 

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation, :email, :pages_read)
    end
end
