class CryptoBookmarksController < ApplicationController

  def create
    @crypto = Crypto.find(params[:crypto_id])
    # authorize @crypto
    @crypto_bookmark = CryptoBookmark.new
    @crypto_bookmark.user = current_user
    @crypto_bookmark.crypto = @crypto
    authorize @crypto_bookmark
    if @crypto_bookmark.save!
      redirect_to crypto_path(@crypto)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @crypto_bookmark = CryptoBookmark.find(params[:id])
    @crypto = @crypto_bookmark.crypto
    authorize @crypto_bookmark
    @crypto_bookmark.destroy!
    redirect_to crypto_path(@crypto)
  end
end
