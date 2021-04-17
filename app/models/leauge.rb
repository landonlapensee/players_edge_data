class Leauge < ApplicationRecord
  require 'csv'

  belongs_to :user
  has_many :teams
  has_many :projections
  validates :name, uniqueness: true
  validates :name, presence: true
  
  def create_projections
    CSV.foreach(Rails.root.join('lib/seeds/projections.csv'), headers: true, header_converters: :symbol, encoding: 'ISO-8859-1') do |row|
      data = row.to_hash
      Projection.create!(
        player_name: data[:player],
        player_team: data[:team],
        goals: data[:goals],
        assists: data[:assists],
        points: data[:points],
        pp_points: data[:pp_points],
        hits: data[:hits],
        blocks: data[:blk],
        pim: data[:pim],
        fow: data[:fow],
        sog: data[:sog],
        leauge: self
      )

    end 
  end
end
