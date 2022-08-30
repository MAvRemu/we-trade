class Squad < ApplicationRecord
  has_many :users, through: :memberships
  belongs_to :user
  has_one :chatroom, dependent: :destroy

  validates :user, presence: true
  validates :chatroom, presence: true
end
