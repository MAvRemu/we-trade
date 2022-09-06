class Watchlist < ApplicationRecord
  belongs_to :squad, optional: true
  has_many :watchings
  has_many :cryptos, through: :watchings
  validates :squad, presence: true
end
