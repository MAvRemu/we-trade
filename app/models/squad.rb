class Squad < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_one :watchlist, dependent: :destroy
  belongs_to :user
  has_one :chatroom, dependent: :destroy
  validates :user, presence: true
  validates :chatroom, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :title, length: { minimum: 2 }
  validates :title, length: { maximum: 40 }
end
