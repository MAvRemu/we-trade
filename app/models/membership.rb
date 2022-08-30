class Membership < ApplicationRecord
  belongs_to :squad
  belongs_to :user
  validates  :user, presence: true
  validates :squad, presence: true
  validates_uniqueness_of :squad, scope: :user
end
