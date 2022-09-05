class PostBookmarksController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    authorize @post
    @post_bookmark = PostBookmark.new
    @post_bookmark.user = current_user
    @post_bookmark.post = @post
    if @post_bookmark.save!
      redirect_to post_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post_bookmark = PostBookmark.find(params[:id])
    @post = @post_bookmark.post
    authorize @post_bookmark
    @post_bookmark.destroy!
    redirect_to post_path(@post)
  end

  private

end
