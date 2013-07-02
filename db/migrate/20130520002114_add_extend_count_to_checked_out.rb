class AddExtendCountToCheckedOut < ActiveRecord::Migration
  def change
  	add_column :checkedouts, :extendCount, :integer, default: 2
  end
end
