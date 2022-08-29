class Membership < ApplicationRecord
  belongs_to :squad
  belongs_to :user
end
