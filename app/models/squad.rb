class Squad < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_one :user
  has_one :chatroom, dependent: :destroy
  validates :user, presence: true
  validates :chatroom, presence: true
end
