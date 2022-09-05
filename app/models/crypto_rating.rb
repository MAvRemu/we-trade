class CryptoRating < ApplicationRecord
  belongs_to :user
  belongs_to :crypto

  validates :crypto, presence: true
  validates :user, presence: true

  validates :user, uniqueness: { scope: :crypto, message: "Should be a unique pair" }

end
