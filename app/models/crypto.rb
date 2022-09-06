class Crypto < ApplicationRecord
  has_many :crypto_bookmarks, dependent: :destroy
  has_many :crypto_comments, dependent: :destroy
  has_many :crypto_ratings, dependent: :destroy
  has_many :watchings, dependent: :destroy


  include PgSearch::Model
  pg_search_scope :search_by_name_and_ticker,
    against: [ :name, :ticker ],
    using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }

  def mcap_short
    output = 0
    if self.market_cap > 1000000000
      output = "#{(self.market_cap/1000000000).round(0)}bln"
    elsif self.market_cap > 1000000
      output = "#{(self.market_cap/1000000).round(0)}mln"
    else
      output = "#{(self.market_cap/1000).round(0)}k"
    end
    output
  end


  def price_short
    output = 0
    if self.price > 1000
      output = "#{(self.price/1000).round(1)}k"
    elsif self.price > 10
      output = "#{(self.price).round(2)}"
    elsif self.price > 1
      output = "#{(self.price).round(3)}"
    else
      output = "#{(self.price).round(4)}"
    end
    output
  end
end
