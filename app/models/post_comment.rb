class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :post_comment

  validates :content, presence: true
  validates :user, presence: true
  validates :post, presence: true
end
