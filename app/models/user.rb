class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :post_bookmarks, dependent: :destroy
  has_many :crypto_bookmarks, dependent: :destroy
  has_many :crypto_comments, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :crypto_ratings, dependent: :destroy
  has_many :post_votes, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :squads, through: :memberships



end
