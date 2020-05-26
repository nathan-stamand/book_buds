class PostsController < ApplicationController

    def new
        @post = Post.new
        @author = current_user
    end

    def create
    end

    def edit
    end

    def create
    end

    def show
        @user = current_user
        @post = Post.find_by(id: params[:id])
    end

    def destroy
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :author_id, :book_id)
    end 
end
