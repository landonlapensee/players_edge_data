class Team < ApplicationRecord
  belongs_to :leauge
  has_many :players, dependent: :destroy
  has_many :projections, :through => :players

  validates :name, uniqueness: { scope: :leauge_id } 
  validates :name, presence: true

  # def total(value)
  #   hey = value
  #   break
  #   total = 0    
  #   self.projections.each do |projection|
  #     total += projection.value
  #   end 
  #   return total
  # end

  # def stats 
  #   number = 20
  #   assists = 40
  #   answer = total(number)
  #   # team_totals = {}
  #   # team_totals[:goals] = total(number) 
  #   # team_totals[:assists] = total(assists)  

  #   # return team_totals
  # end 


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

  def pp_points
    total = 0    
    self.projections.each do |projection|
      total += projection.pp_points
    end 
    return total
  end 
  
  def hits
    total = 0    
    self.projections.each do |projection|
      total += projection.hits
    end 
    return total
  end 

  def blocks
    total = 0    
    self.projections.each do |projection|
      total += projection.blocks
    end 
    return total
  end 

  def pim
    total = 0    
    self.projections.each do |projection|
      total += projection.pim
    end 
    return total
  end 

  def fow
    total = 0    
    self.projections.each do |projection|
      total += projection.fow
    end 
    return total
  end 

  def sog
    total = 0    
    self.projections.each do |projection|
      total += projection.sog
    end 
    return total
  end 
end
