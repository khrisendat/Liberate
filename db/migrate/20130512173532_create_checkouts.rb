class CreateCheckouts < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|
    	t.references :book
    	t.references :user
      t.timestamps
    end
  end
end
