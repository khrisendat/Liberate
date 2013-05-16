class Book < ActiveRecord::Base
  attr_accessible :name, :author, :image_url, :description, :isbn, :is_checked_out, :is_reserved, :keyword1

  has_one :user, :through => :checkedout
  has_one :user, :through => :reserved
  has_one :checkedout
  has_one :reserved

  has_many :comments

  validates :name, presence: true
  validates :author, presence: true
  validates :image_url, presence: true
  validates :description, presence: true


  def self.search(search)
  	search_condition = "%" + search + "%"
  	find(:all, :conditions => ['name LIKE ? OR author LIKE ?', search_condition, search_condition])
  end

  def self.searchkeywords(search)
    search_condition = "%" + search + "%"
    find(:all, :conditions => ['keyword1 LIKE ?', search_condition])
  end
end
