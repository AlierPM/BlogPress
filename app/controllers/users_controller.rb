class UsersController < ApplicationController
  # before_action :set_user, only: [:show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def user_posts
    @user = User.find(params[:id])
    @posts = @user.posts.includes(:comments, :user)
  end
end
