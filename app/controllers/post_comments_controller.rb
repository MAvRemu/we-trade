class PostCommentsController < ApplicationController
  def create
    @comment = PostComment.new(comment_params)
    authorize @comment
    @comment.user = current_user
    @comment.post = Post.find(params[:post_id])

    if @comment.save!
      redirect_to post_path(Post.find(params[:post_id]))
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:post_comment).permit(:content, :content_trix)
  end
end
