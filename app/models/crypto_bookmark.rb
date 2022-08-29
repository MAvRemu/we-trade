class CryptoBookmark < ApplicationRecord
  belongs_to :user
  belongs_to :crypto

  validates :crypto, presence: true
  validates :user, presence: true
end
