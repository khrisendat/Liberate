class Reserve < ActiveRecord::Base
   	attr_accessible :user_id, :book_id

  	validates :book_id, presence: true
  	validates :user_id, presence: true


  	belongs_to :user
  	belongs_to :book
end
