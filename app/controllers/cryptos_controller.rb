class CryptosController < ApplicationController
  def index
    @cryptos = policy_scope(Crypto)
    if params[:filter] == "rank"
      @cryptos = Crypto.all.order(:rank).page params[:page]
    elsif params[:filter] == "comments"
      @cryptos_unpaginated = Crypto.all.includes(:crypto_comments).sort{ |a, b| b.crypto_comments.count <=> a.crypto_comments.count }
      @cryptos = Kaminari.paginate_array(@cryptos_unpaginated).page(params[:page])
    elsif params[:filter] == "ratings"
      @cryptos_unpaginated = Crypto.all.includes(:crypto_ratings).sort do |a, b|
        b.crypto_ratings.sum(:rating).to_f/b.crypto_ratings.size <=> a.crypto_ratings.sum(:rating).to_f/a.crypto_ratings.size
      end
      @cryptos = Kaminari.paginate_array(@cryptos_unpaginated).page(params[:page])
    elsif params[:filter] == "votes"
      @cryptos_unpaginated = Crypto.page(params[:page]).all.includes(:crypto_ratings).sort do |a, b|
        b.crypto_ratings.count <=> a.crypto_ratings.count
      end
      @cryptos = Kaminari.paginate_array(@cryptos_unpaginated).page(params[:page])
    elsif params[:filter] == "hot"
      @cryptos_unpaginated = Crypto.all.includes(:crypto_comments).sort do |a, b|
        b.crypto_comments.last.created_at <=> a.crypto_comments.last.created_at
      end
      @cryptos = Kaminari.paginate_array(@cryptos_unpaginated).page(params[:page])
    else
      @cryptos = Crypto.all.order(:name).page params[:page]
    end
    # @cryptos.page params[:page]
  end

  def show
    @crypto = Crypto.find(params[:id])
    authorize @crypto
    @rating = @crypto.crypto_ratings.sum(:rating).to_f / @crypto.crypto_ratings.size
    @comment = CryptoComment.new
  end

  def new
  end

  def create
  end

  def destroy
  end

  def like
  end

  private

end
