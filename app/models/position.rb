class Position < ApplicationRecord
  belongs_to :meet
  belongs_to :athlete
  validates :athlete_id, uniqueness: true
end
