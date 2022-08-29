class SquadMessage < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  validates :chatroom, presence: true
  validates :user, presence: true
end
