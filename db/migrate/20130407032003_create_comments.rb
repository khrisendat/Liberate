class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment

      t.integer :book_id
      t.integer :user_id

      t.timestamps
    end

    add_index :comments, :book_id
    add_index :comments, :user_id
  end
end
