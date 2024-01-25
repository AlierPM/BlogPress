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
    @like = Like.new # Ensure @like is initialized
    @comment = Comment.new
  end

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.new
  end

  def create
    @post = Post.new(post_params.merge(author_id: current_user.id, comments_counter: 0, likes_counter: 0))

    if @post.save
      flash[:notice] = 'Post created successfully.'
      redirect_to user_post_path(@current_user, @post)
    else
      flash[:alert] = 'Error creating post. Please check the form and try again.'
      render :new
    end
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

def post_params
  params.require(:post).permit(:title, :text)
end
