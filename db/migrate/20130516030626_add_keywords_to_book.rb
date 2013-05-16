class AddKeywordsToBook < ActiveRecord::Migration
  def change
  	add_column :books, :keyword1, :string, default: ""
  end
end