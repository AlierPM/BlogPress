class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_posts_counter
  after_save :update_comments_counter
  after_save :update_likes_counter

  private

  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end

  def update_likes_counter
    post.update(likes_counter: likes.count)
  end

  def update_comments_counter
    update(comments_counter: comments.count)
  end

  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
