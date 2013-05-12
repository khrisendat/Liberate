class Book < ActiveRecord::Base
  attr_accessible :name, :author, :image_url, :description, :isbn, :is_checked_out

  has_many :comments

  validates :name, presence: true
  validates :author, presence: true
  validates :image_url, presence: true
  validates :description, presence: true
end
