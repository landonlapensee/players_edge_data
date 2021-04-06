class Projection < ApplicationRecord
  belongs_to :leauge
  has_one :player
end
