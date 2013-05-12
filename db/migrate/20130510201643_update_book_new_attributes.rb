class UpdateBookNewAttributes < ActiveRecord::Migration
  def change
  	add_column :books, :isbn, :string
  	add_index :books,:isbn

  	add_column :books, :is_checked_out, :boolean, default: false
  end
end
