class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_posts_counter

  def update_posts_counter
    update_columns(posts_counter: posts.count)
  end

  def three_most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
