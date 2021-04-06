class Team < ApplicationRecord
  belongs_to :leauge
  has_many :players
  validates :name, uniqueness: true
  validates :name, presence: true
end

