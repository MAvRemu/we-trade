class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def mycryptos
    @crypto_bookmarks = CryptoBookmark.all.where(user: current_user)
    @mycryptos = @crypto_bookmarks.map(&:crypto)
  end

  def myposts
    @post_bookmarks = PostBookmark.all.where(user: current_user)
    @myposts = @post_bookmarks.map(&:post)
  end
end
