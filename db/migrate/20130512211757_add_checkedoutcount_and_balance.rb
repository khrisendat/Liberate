class AddCheckedoutcountAndBalance < ActiveRecord::Migration
  def change
  	add_column :users, :balance, :float, default: 0.0
  	add_column :users, :checkedout_count, :integer, default: 3
  end
end
