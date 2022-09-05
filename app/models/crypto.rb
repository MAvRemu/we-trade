class Crypto < ApplicationRecord
  has_many :crypto_bookmarks, dependent: :destroy
  has_many :crypto_comments, dependent: :destroy
  has_many :crypto_ratings, dependent: :destroy

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
end
