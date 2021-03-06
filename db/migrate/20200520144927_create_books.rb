class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :author_id
      t.integer :page_count
      t.integer :genre_id
      t.integer :reader_count
      t.integer :rating

      t.timestamps
    end
  end
end
