class Watching < ApplicationRecord
  belongs_to :crypto
  belongs_to :watchlist
end
