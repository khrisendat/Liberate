class Comment < ActiveRecord::Base
  attr_accessible :comment, :book_id

  belongs_to :user
  belongs_to :book

  validates :book_id, presence: true
  validates :user_id, presence: true
  validates :comment, presence: true

#stating that the comments should be oderded from newest to oldest created_at date.
  default_scope order: 'comments.created_at DESC'
end
