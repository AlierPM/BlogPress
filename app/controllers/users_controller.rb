class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = current_user
    @user = User.find(params[:id])
    @post = Post.find(params[:id])
    @user_posts = @user ? @user.posts : []
    @user_posts = @user.posts
    @three_most_recent_posts = @user.posts.three_most_recent_posts
  end
end
