class Addtoactivetocheckedouts < ActiveRecord::Migration
  def change
  	add_column :checkedouts, :active, :boolean, default: true
  end
end
