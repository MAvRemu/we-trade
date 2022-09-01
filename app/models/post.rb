class Post < ApplicationRecord
  belongs_to :user
  has_one :squad, required: false
  has_one_attached :photo
  has_many :post_comments, dependent: :destroy
  has_many :post_bookmarks, dependent: :destroy
  has_many :post_votes, dependent: :destroy
  validates :content_trix, presence: true
  has_rich_text :content_trix
end
