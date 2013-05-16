class Adddateduetocheckedout < ActiveRecord::Migration
  def change
  	add_column :checkedouts, :datedue, :date
  end
end
