class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.string :image_url
      t.string :description
      t.timestamps
    end
  end
end
