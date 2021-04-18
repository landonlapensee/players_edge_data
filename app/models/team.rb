class Team < ApplicationRecord
  belongs_to :leauge
  has_many :players, dependent: :destroy
  has_many :projections, :through => :players

  validates :name, uniqueness: { scope: :leauge_id } 
  validates :name, presence: true
end
