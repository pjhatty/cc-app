class Meet < ApplicationRecord
  has_many :positions
  has_many :athletes, through: :positions
end
