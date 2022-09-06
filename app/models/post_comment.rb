class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :post_nested_comments
  validates :content_trix, presence: true
  validates :user, presence: true
  validates :post, presence: true

  has_rich_text :content_trix
end
