class Reserved < ActiveRecord::Base
  attr_accessible :book_id, :user_id, :active

    validates :book_id, presence: true
  	validates :user_id, presence: true


  	belongs_to :user
  	belongs_to :book
end
