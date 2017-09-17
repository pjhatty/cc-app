class Score < ApplicationRecord
  belongs_to :wod
  belongs_to :athlete
  validates :athlete_id, uniqueness: true
end
