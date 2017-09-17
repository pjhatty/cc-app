class Meet < ApplicationRecord
  has_many :positions
  has_many :athletes, through: :positions
  validates :title, uniqueness: true
end
