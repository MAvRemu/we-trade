class Watching < ApplicationRecord
  belongs_to :crypto
  belongs_to :watchlist
  validates :crypto, uniqueness: { scope: :watchlist,
    message: "You are already tracking this item" }
end
