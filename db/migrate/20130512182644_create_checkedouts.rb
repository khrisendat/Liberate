class CreateCheckedouts < ActiveRecord::Migration
  def change
    create_table :checkedouts do |t|
    	t.references :book
    	t.references :user
      t.timestamps
    end
  end
end
