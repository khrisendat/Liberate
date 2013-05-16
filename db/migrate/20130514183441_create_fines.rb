class CreateFines < ActiveRecord::Migration
  def change
    create_table :fines do |t|
      t.references :checkedout
      t.float :amount
      t.timestamps
    end
  end
end
