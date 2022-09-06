class CryptoNestedComment < ApplicationRecord
  belongs_to :user
  belongs_to :crypto_comment
  has_rich_text :content_trix
  validates :content_trix, presence: true
end
