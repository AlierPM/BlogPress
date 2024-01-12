class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  after_save :update_post_counter

  private

  def update_post_counter
    increment!(:posts_counter)
  end

  def three_most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
