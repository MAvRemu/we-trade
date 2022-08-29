class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_one :squad, required: false
  has_one_attached :photo
end
