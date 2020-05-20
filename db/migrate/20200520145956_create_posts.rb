class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :author_id
      t.datetime :date_created
      t.boolean :edited
      t.string :content
      t.integer :book_id

      t.timestamps
    end
  end
end
