class Chatroom < ApplicationRecord
  belongs_to :squad, optional: true
  has_many :squad_messages, dependent: :destroy
end
