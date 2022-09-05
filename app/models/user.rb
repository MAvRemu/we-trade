class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true
  validates :password, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :username, uniqueness: true

  has_many :post_bookmarks, dependent: :destroy
  has_many :crypto_bookmarks, dependent: :destroy
  has_many :cryptos, through: :crypto_bookmarks
  has_many :crypto_comments, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :post_nested_comments, dependent: :destroy
  has_many :crypto_ratings, dependent: :destroy
  has_many :post_votes, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :bookmark_posts, source: :post, through: :post_bookmarks
  has_many :memberships, dependent: :destroy

  has_many :squads, through: :memberships
  has_one_attached :photo
end
