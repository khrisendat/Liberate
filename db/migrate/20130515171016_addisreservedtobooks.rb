class Addisreservedtobooks < ActiveRecord::Migration
  def change
  	add_column :books, :is_reserved, :boolean , :default => false
  end
end
