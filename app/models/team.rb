class Team < ApplicationRecord
  belongs_to :leauge
  has_many :players
  has_many :projections, :through => :players

  validates :name, uniqueness: true
  validates :name, presence: true
end

