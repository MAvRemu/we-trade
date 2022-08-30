class CryptoCommentsController < ApplicationController
  def create
    @comment = CryptoComment.new(comment_params)
    authorize @comment
    @comment.user = current_user
    @comment.crypto = Crypto.find(params[:crypto_id])

    if @comment.save!
      redirect_to crypto_path(Crypto.find(params[:crypto_id]))
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:crypto_comment).permit(:content)
  end

end
