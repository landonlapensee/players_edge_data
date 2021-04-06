class Leauge < ApplicationRecord
  belongs_to :user
  has_many :teams
  has_many :projections
  validates :name, uniqueness: true
  validates :name, presence: true
end
