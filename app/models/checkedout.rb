class Checkedout < ActiveRecord::Base
  attr_accessible :user_id, :book_id, :active, :datedue

  validates :book_id, presence: true
  validates :user_id, presence: true


  belongs_to :user
  belongs_to :book

  has_one :fine
end
