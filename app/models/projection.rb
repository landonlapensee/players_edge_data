class Projection < ApplicationRecord
  belongs_to :leauge 
  has_one :player, dependent: :destroy
  has_one :team, :through => :player

  def selected?
    self.player ? true : false 
  end
end
