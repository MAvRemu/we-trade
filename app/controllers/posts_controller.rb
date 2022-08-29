class PostsController < ApplicationController

  def show
  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def upvote
  end

  def downvote
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save!
      redirect_to wearable_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :photo)
  end

end
