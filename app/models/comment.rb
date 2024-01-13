# app/models/comment.rb
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user_id, presence: true
  validates :text, presence: true
  validates :post_id, numericality: { only_integer: true }
end
