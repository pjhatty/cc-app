class Position < ApplicationRecord
  belongs_to :meet
  belongs_to :athlete
end
