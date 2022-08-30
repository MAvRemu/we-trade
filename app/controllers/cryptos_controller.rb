class CryptosController < ApplicationController
  def index

    if params[:filter] == "rank"
      @cryptos = Crypto.order(:rank)
    elsif params[:filter] == "comments"
      @cryptos = Crypto.all.sort do |a, b|
      b.crypto_comments.count <=> a.crypto_comments.count
    end
    elsif params[:filter] == "ratings"
      @cryptos = Crypto.all.sort do |a, b|
      b.crypto_ratings.sum(:rating).to_f/b.crypto_ratings.size <=> a.crypto_ratings.sum(:rating).to_f/a.crypto_ratings.size
    end
    elsif params[:filter] == "votes"
      @cryptos = Crypto.all.sort do |a, b|
      b.crypto_ratings.count <=> a.crypto_ratings.count
    end
    elsif params[:filter] == "hot"
      @cryptos = Crypto.all.sort do |a, b|
      b.crypto_comments.last.created_at <=> a.crypto_comments.last.created_at
    end
    else
      @cryptos = Crypto.all
    end
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end

  def like
  end

end
