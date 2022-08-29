class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_one :squad, required: false
  has_one_attached :photo
  has_many :post_comment, dependent: :destroy
  has_many :post_bookmarks, dependent: :destroy
  has_many :post_votes, dependent: :destroy
end
