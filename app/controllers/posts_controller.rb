class PostsController < ApplicationController

    def new
        @post = Post.new
        @author = current_user
    end

    def create
        @post = Post.new(post_params)
        @author = current_user
        if params[:post][:book_id].nil? 
            flash[:message] = "You must select a book for your post."
            render new_post_path
        elsif @post.save
            @author.posts << @post 
            @author.save
            redirect_to user_post_path(@author, @post)
        else 
            render new_user_post_path
        end
    end

    def edit
    end

    def update

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
