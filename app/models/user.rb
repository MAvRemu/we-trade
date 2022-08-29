class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_bookmarks
  has_many :crypto_bookmarks
  has_many :crypto_comments
  has_many :post_comments
  has_many :crypto_ratings
  has_many :post_votes
  has_many :posts
  has_many :squads, through: :memberships



end
