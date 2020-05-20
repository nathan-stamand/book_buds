class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.string :content
      t.integer :post_id
      t.datetime :date_created
      t.boolean :edited

      t.timestamps
    end
  end
end
