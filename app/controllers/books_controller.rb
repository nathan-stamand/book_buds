class BooksController < ApplicationController

    def index 
        @user = current_user 
        @books = Book.filter_books(params)
        @authors = Author.all
        @genres = Genre.all
    end

    def new
        @book = Book.new
        @authors = Author.all 
        @genres = Genre.all
    end

    def create
        @user = current_user
        @book = Book.new(book_params)
        if @book.save 
            @user.books << @book
            @user.save
            redirect_to user_book_path(@user, @book)
        else 
            flash[:message] = "Error!"
            render new_user_book_path(@user)
        end
    end

    def edit
    end

    def update
    end

    def show
        if @book = Book.find_by(id: params[:id])
            @author = @book.author 
            @genre = @book.genre
        end
    end

    def destroy

    end

    private 

    def book_params
        params.require(:book).permit(:title, :author_name, :genre_name, :page_count)
    end

end
