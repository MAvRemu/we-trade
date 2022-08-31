class CryptoComment < ApplicationRecord
  belongs_to :user
  belongs_to :crypto
  has_one :crypto_comment, required: false, dependent: :destroy
  validates :user, presence: true
  validates :crypto, presence: true
  validates :content_trix, presence: true
  has_rich_text :content_trix

end
