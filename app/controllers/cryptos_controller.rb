class CryptosController < ApplicationController
  def index
    @cryptos = policy_scope(Crypto)
    @count = 0
    if (params[:query])
      @cryptos = Crypto.search_by_name_and_ticker(params[:query])
      @count = @cryptos.size
      @cryptos = filter_cryptos(@cryptos)

    else
      @count = @cryptos.size
      @cryptos = filter_cryptos(Crypto.all)
    end

    respond_to do |format|
      format.html
      format.text { render partial: "cryptos/list", locals: {cryptos: @cryptos, squad: Squad.find(params[:squad_id])}, formats: [:html] }
    end
  end

  def show
    @crypto = Crypto.find(params[:id])
    authorize @crypto
    @rating = @crypto.crypto_ratings.sum(:rating).to_f / @crypto.crypto_ratings.size
    @comment = CryptoComment.new
    @crypto_bookmark_present = CryptoBookmark.exists?(user: current_user, crypto: @crypto)
    if @crypto_bookmark_present
      @crypto_bookmark = CryptoBookmark.find_by(user: current_user, crypto: @crypto)
    else
      @crypto_bookmark = CryptoBookmark.new
    end
  end

  def mycryptos
    @mycryptos = current_user.cryptos
    authorize @mycryptos
    @mycryptos = filter_cryptos(@mycryptos)
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

  def filter_cryptos(cryptos)

    if params[:filter] == "rank"
      @cryptos = cryptos.order(:rank).page params[:page]
    elsif params[:filter] == "comments"
      @cryptos_unpaginated = cryptos.includes(:crypto_comments, :crypto_ratings).sort{ |a, b| b.crypto_comments.size <=> a.crypto_comments.size }
      @cryptos = Kaminari.paginate_array(@cryptos_unpaginated).page(params[:page])
    elsif params[:filter] == "ratings"
      @cryptos_unpaginated = cryptos.includes(:crypto_comments, :crypto_ratings).sort do |a, b|
        b.crypto_ratings.sum(:rating).to_f / b.crypto_ratings.size <=> a.crypto_ratings.sum(:rating).to_f / a.crypto_ratings.size
      end
      @cryptos = Kaminari.paginate_array(@cryptos_unpaginated).page(params[:page])
    elsif params[:filter] == "votes"
      @cryptos_unpaginated = cryptos.includes(:crypto_comments, :crypto_ratings).sort do |a, b|
        b.crypto_ratings.size <=> a.crypto_ratings.size
      end
      @cryptos = Kaminari.paginate_array(@cryptos_unpaginated).page(params[:page])
    elsif params[:filter] == "hot"
      @cryptos_unpaginated = cryptos.includes(:crypto_comments, :crypto_ratings).sort do |a, b|
        b.crypto_comments.last.created_at <=> a.crypto_comments.last.created_at
      end
      @cryptos = Kaminari.paginate_array(@cryptos_unpaginated).page(params[:page])
    else
      @cryptos = cryptos.order(:name).page params[:page]
    end
    return @cryptos
  end
end
