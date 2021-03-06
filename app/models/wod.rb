class Wod < ApplicationRecord
  has_many :scores
  has_many :athletes, through: :scores
  validates :title, uniqueness: true
end
