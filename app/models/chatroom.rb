class Chatroom < ApplicationRecord
  belongs_to :squad
  has_many :squad_messages, dependent: :destroy

end
