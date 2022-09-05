class PostBookmark < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :post, presence: true
  validates :user, presence: true

  validates :user, uniqueness: { scope: :post, message: "Should be a unique pair" }
end
