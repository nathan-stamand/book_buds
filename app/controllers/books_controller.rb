class BooksController < ApplicationController

    def new
        @book = Book.new
        @authors = Author.all 
        @genres = Genre.all
    end

    def create
        @book = Book.new(book_params)
    end

    def edit
    end

    def update
    end

    def show
    end

    def destroy

    end

    private 

    def book_params
        params.require(:book).permit(:title, :author_name, :genre_name, :page_count)
    end

end
