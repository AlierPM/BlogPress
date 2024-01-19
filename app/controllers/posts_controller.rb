class PostsController < ApplicationController
  before_action :find_user
  before_action :find_post, only: [:show]

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments).paginate(page: params[:page], per_page: 2)
  end

  def show
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_post
    find_user
    @post = @user.posts.find_by(id: params[:id])

    return if @post

    respond_to do |format|
      format.html { render 'post_not_found' and return }
      format.js { render 'post_not_found' and return }
    end
  end
end
