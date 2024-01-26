class CommentsController < ApplicationController
  before_action :set_post, only: %i[new create]

  def new
    @user = current_user
    @post = Post.includes(:comments).find(params[:post_id]) # Use eager loading to fetch the associated post
    @comment = @post.comments.new
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html do
          flash[:notice] = 'Comment created successfully.'
          redirect_to user_post_path(@user, @post)
        end
      else
        format.html { render :new }
      end
    end
  end

  private

  def set_post
    @user = current_user
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
