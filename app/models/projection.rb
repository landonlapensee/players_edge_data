class Projection < ApplicationRecord
  belongs_to :leauge 
  has_one :player
  has_one :team, :through => :player
end
