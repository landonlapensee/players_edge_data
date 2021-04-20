class Team < ApplicationRecord
  belongs_to :leauge
  has_many :players, dependent: :destroy
  has_many :projections, :through => :players

  validates :name, uniqueness: { scope: :leauge_id } 
  validates :name, presence: true

  def goals
    total = 0    
    self.projections.each do |projection|
      total += projection.goals
    end 
    return total
  end 

  def assists
    total = 0    
    self.projections.each do |projection|
      total += projection.assists
    end 
    return total
  end 
end
