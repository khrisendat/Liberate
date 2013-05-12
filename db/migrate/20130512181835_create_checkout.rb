class CreateCheckout < ActiveRecord::Migration
  def change
  		create_table :reserves do |t|
    	t.references :book
    	t.references :user
      t.timestamps
  end
end
