class Leauge < ApplicationRecord
  require 'csv'

  belongs_to :user
  has_many :teams, dependent: :destroy
  has_many :projections, dependent: :destroy
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

  # def get_stats
  #   teams = []
  #   all_teams = self.teams
  #   all_teams.each do |team|
  #     teams << team.stats
  #   end
  # end 

  def sort_teams
    #Get all teams in the leauge
    all_teams = self.teams
    final = []
    team_with_category_rank = {}
    #Sort the teams in each category 
    array_of_totals = []
    
    array_of_totals << all_teams.sort_by { |team| team.assists }.reverse
    array_of_totals << all_teams.sort_by { |team| team.pp_points }.reverse
    array_of_totals << all_teams.sort_by { |team| team.hits }.reverse
    array_of_totals << all_teams.sort_by { |team| team.blocks }.reverse
    array_of_totals << all_teams.sort_by { |team| team.pim }.reverse
    array_of_totals << all_teams.sort_by { |team| team.fow }.reverse
    array_of_totals << all_teams.sort_by { |team| team.sog }.reverse
    array_of_totals << all_teams.sort_by { |team| team.goals }.reverse

    # total_goal_array = all_teams.sort_by { |team| team.goals }.reverse
    # total_assist_array = all_teams.sort_by { |team| team.assists }.reverse
    # total_assist_pp_points = all_teams.sort_by { |team| team.pp_points }.reverse
    # total_assist_hits = all_teams.sort_by { |team| team.hits }.reverse
    # total_assist_blks = all_teams.sort_by { |team| team.blks }.reverse
    # total_assist_pim = all_teams.sort_by { |team| team.pim }.reverse
    # total_assist_fow = all_teams.sort_by { |team| team.fow }.reverse
    # total_assist_sog = all_teams.sort_by { |team| team.sog }.reverse
    
    
    #Award points to each team based on their index in the array
    counter = 0
    array_of_totals.each_with_index do |array, i|
      counter += 1
      if counter <= 1
        array.each_with_index do |team, index|
          team_with_category_rank[team] = (index + 1)
        end 
      end

      if counter > 1
        array.each_with_index do |team, index|
          team_total = team_with_category_rank[team] + ( index + 1 ) 
          team_with_category_rank[team] = team_total 
        end 
      end 
    end 

    # total_goal_array.each_with_index do |team, index|
    #   team_with_category_rank[team] = (index + 1)
    # end

    # total_assist_array.each_with_index do |team, index|
    #   team_total = team_with_category_rank[team] + ( index + 1 ) 
    #   team_with_category_rank[team] = team_total 
    # end

    team_with_category_rank.sort_by{|k,v| v}
    # testing = team_with_category_rank.sort_by{|k,v| -v}.each do |team, rank|
    #   final << team
    # end 
  end 
end
