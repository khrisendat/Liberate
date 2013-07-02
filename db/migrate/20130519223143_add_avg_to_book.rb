class AddAvgToBook < ActiveRecord::Migration
  def change
  	add_column :books, :avg, :int, default: 0
  end
end
