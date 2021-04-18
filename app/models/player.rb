class Player < ApplicationRecord
  belongs_to :projection
  belongs_to :team

  validates :projection_id, uniqueness: true
end
