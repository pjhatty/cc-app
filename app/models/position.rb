class Position < ApplicationRecord
  belongs_to :meet
  belongs_to :athlete
  validates_uniqueness_of :athlete_id, :scope => [:meet_id]
end
