class CryptoRatingsController < ApplicationController
  def create
    @crypto = Crypto.find(params[:crypto_id])
    @crypto_rating = CryptoRating.find_by(user: current_user, crypto_id: params[:crypto_id])
    if @crypto_rating.present?
      @crypto_rating.update!(crypto_rating_params)
      authorize @crypto_rating
      redirect_to crypto_path(@crypto)
    else
      @crypto_rating = CryptoRating.new(crypto_rating_params)
      @crypto_rating.user = current_user
      @crypto_rating.crypto = @crypto
      if @crypto_rating.save!
        authorize @crypto_rating
        redirect_to crypto_path(@crypto)
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def update
    @crypto = Crypto.find(params[:crypto_id])
    @crypto_rating = CryptoRating.find_by(user: current_user, crypto_id: params[:crypto_id])
    @crypto_rating.update!(crypto_rating_params)
    authorize @crypto_rating
    redirect_to crypto_path(@crypto)
  end

  private

  def crypto_rating_params
    params.require(:crypto_rating).permit(:rating)
  end
end
