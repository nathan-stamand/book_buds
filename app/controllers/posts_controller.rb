class PostsController < ApplicationController

    def new
        @post = Post.new
    end

    def create
    end

    def edit
    end

    def create
    end

    def show
    end

    def destroy
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :author_id, :book_id)
    end 
end
