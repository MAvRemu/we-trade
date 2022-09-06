class CryptoNestedCommentsController < ApplicationController
  def create
    @nested_comment = CryptoNestedComment.new(comment_params)
    authorize @nested_comment
    @nested_comment.user = current_user
    @nested_comment.crypto_comment = CryptoComment.find(params[:crypto_comment_id])
    if @nested_comment.save!
      redirect_to crypto_path(Crypto.find(params[:crypto_id]))
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:crypto_nested_comment).permit(:content_trix)
  end
end
