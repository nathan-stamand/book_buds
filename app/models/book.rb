class Book < ApplicationRecord
    has_many :user_books 
    has_many :users, through: :user_books
    has_many :posts
    belongs_to :author 
    belongs_to :genre
end
