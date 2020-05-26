class Book < ApplicationRecord
    has_many :user_books 
    has_many :users, through: :user_books
    has_many :posts
    belongs_to :author 
    belongs_to :genre

    def author_name=(name)
        self.author = Author.find_or_create_by(name: name)
    end 

    def author_name
        self.author ? self.author.name : nil 
    end

    def genre_name=(name)
        self.genre = Genre.find_or_create_by(name: name)
    end

    def genre_name 
        self.genre ? self.genre.name : nil
    end 

    def self.by_author(author_id)
        where(author: author_id)
    end

    def self.in_genre(genre_id)
        where(genre: genre_id)
    end
    
    def self.filter_books(params)
        @books = self.all
        if !params[:author].blank?
            @books = @books.by_author(params[:author])
            if !params[:genre].blank?
                @books = @books.in_genre(params[:genre])
            end
        elsif !params[:genre].blank?
            @books = @books.in_genre(params[:genre])
        else 
            @books = self.all
        end
        @books
    end
end
