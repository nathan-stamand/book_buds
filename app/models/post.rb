class Post < ApplicationRecord
    belongs_to :author, 
        :class_name => "User"
    belongs_to :book
    has_many :comments 
    has_many :users, through: :comments
end
