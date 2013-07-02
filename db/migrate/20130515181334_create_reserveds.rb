class CreateReserveds < ActiveRecord::Migration
  def change
    create_table :reserveds do |t|
	  t.references :book
      t.references :user
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
 