class LikesController < ApplicationController
  def new
    @user = current_user
    @post = Post.find(params[:post_id] || params[:id])
    @like = Like.new
  end

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.new(user: current_user)

    respond_to do |format|
      if @like.save
        flash[:notice] = 'Like created successfully.'
        format.html { redirect_to user_post_path(@post.author, @post) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end
end
