class Book < ActiveRecord::Base
  attr_accessible :name, :author, :image_url, :description, :isbn, :is_checked_out

  has_one :user, :through => :checkedout
  has_one :checkedout
  has_many :comments

  validates :name, presence: true
  validates :author, presence: true
  validates :image_url, presence: true
  validates :description, presence: true


  def self.search(search)
  	search_condition = "%" + search + "%"
  	find(:all, :conditions => ['name LIKE ? OR author LIKE ?', search_condition, search_condition])
  end


end
