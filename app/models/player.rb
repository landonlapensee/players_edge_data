class Player < ApplicationRecord
  belongs_to :projection
  belongs_to :team
end
