class BooksController < ApplicationController

    def new
        @book = Book.new
        @authors = Author.all 
        @genres = Genre.all
    end

    def create
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
        params.require(:books).permit(:title, :author, :genre, :page_count)
    end

end
