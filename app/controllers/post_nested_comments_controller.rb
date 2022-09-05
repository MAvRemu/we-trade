class PostNestedCommentsController < ApplicationController
  def create
    @nested_comment = PostNestedComment.new(comment_params)
    authorize @nested_comment
    @nested_comment.user = current_user
    @nested_comment.post_comment = PostComment.find(params[:post_comment_id])
    if @nested_comment.save!
      redirect_to post_path(Post.find(params[:post_id]))
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:post_nested_comment).permit(:content_trix)
  end
end
