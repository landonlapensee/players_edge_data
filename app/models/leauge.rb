class Leauge < ApplicationRecord
  require 'csv'

  belongs_to :user
  has_many :teams, dependent: :destroy
  has_many :projections, dependent: :destroy
  validates :name, uniqueness: true
  validates :name, presence: true
  
  CATEGORIES = [ :goals, :assists, :hits, :blocks, :pim, :fow, :sog ]

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

  def sort_teams
    #Get all teams in the leauge
    @array_of_totals = []
    @team_with_category_rank = {}
    sort_totals
    calculate_totals
    @team_with_category_rank.sort_by{|k,v| v}
  end 

  def sort_totals
    Leauge::CATEGORIES.each do |category|
      @array_of_totals << teams.sort_by { |team| team.total(category) }.reverse
    end
  end

  def calculate_totals
    counter = 0
    @array_of_totals.each_with_index do |array, i|
      counter += 1
      if counter <= 1
        array.each_with_index do |team, index|
          @team_with_category_rank[team] = (index + 1)
        end 
      end

      if counter > 1
        array.each_with_index do |team, index|
          team_total = @team_with_category_rank[team] + ( index + 1 ) 
          @team_with_category_rank[team] = team_total 
        end 
      end 
    end 
  end 

  def category_ranking(x, value)
    rank = 1
    sorted_teams = teams.sort_by { |team| team.total(value) }.reverse
    sorted_teams.each_with_index { |team, index| ( team === x ) ? ( rank += index ) : nil }        
    return rank
  end
end
