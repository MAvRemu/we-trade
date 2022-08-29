class CryptoComment < ApplicationRecord
  belongs_to :user
  belongs_to :crypto

  validates :user, presence: true
  validates :crypto, presence: true
  validates :content, presence: true

end
