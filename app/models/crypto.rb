class Crypto < ApplicationRecord
  has_many :crypto_bookmarks, dependent: :destroy
  has_many :crypto_comments, dependent: :destroy
  has_many :crypto_ratings, dependent: :destroy

  validates :name, presence: true
  validates :ticker, presence: true
  validates :price, presence: true
end
