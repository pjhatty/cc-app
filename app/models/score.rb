class Score < ApplicationRecord
  belongs_to :wod
  belongs_to :athlete
  validates_uniqueness_of :athlete_id , :scope => [:wod_id]
