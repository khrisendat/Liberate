class AddToCheckouts < ActiveRecord::Migration
  def change
  	add_column :checkouts, :user, :integer
  end
end
