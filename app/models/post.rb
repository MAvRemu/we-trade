class Post < ApplicationRecord
  belongs_to :user
  has_one :squad, required: false
  has_one_attached :photo
end
