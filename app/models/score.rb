class Score < ApplicationRecord
  belongs_to :wod
  belongs_to :athlete
end
