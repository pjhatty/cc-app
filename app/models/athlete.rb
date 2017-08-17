class Athlete < ApplicationRecord
  has_many :positions
  has_many :scores
  has_many :meets, through: :positions
  has_many :wods, through: :scores

  def full_name
    "#{first_name} #{last_name}"
  end
end
