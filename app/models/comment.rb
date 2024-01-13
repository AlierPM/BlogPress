# app/models/comment.rb
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :update_comments_counter

  def update_comments_counter
    # update(comments_counter: comments.count)
    Post.increment_counter(:comments_counter, post_id)
  end

  validates :user_id, presence: true
  validates :text, presence: true
  validates :post_id, numericality: { only_integer: true }
end
