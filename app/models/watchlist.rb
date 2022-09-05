class Watchlist < ApplicationRecord
  belongs_to :squad
  has_many :watchings
  has_many :cryptos, through: :watchings
  validates :squad, presence: true
end
