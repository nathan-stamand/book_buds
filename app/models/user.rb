class User < ApplicationRecord
    has_many :user_books
    has_many :books, through: :user_books
    has_many :comments 
    has_many :posts, through: :comments 
    has_many :authored_posts,
     :class_name => "Post", 
     :foreign_key => :author_id
    has_secure_password
end
