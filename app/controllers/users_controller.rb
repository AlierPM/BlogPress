class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @users = User.all.includes(:posts, :comments, :likes).order('posts.created_at ASC')
  end

  def show
    @user = User.includes(:posts).find(params[:id]) # Preload associated posts
    # @user = User.find(params[:id]).includes(:posts)
    # pp "user is #{@user}"
    @user_posts = @user ? @user.posts.order('created_at ASC') : []
    @three_most_recent_posts = @user.posts.order('created_at ASC').three_most_recent_posts
    @posts = @user.posts.includes(:comments, :likes).limit(3)
  end
end
