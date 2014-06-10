class Game < ActiveRecord::Base
	belongs_to :team1, class_name: 'Team', foreign_key: 'team1_id'
	belongs_to :team2, class_name: 'Team', foreign_key: 'team2_id'


	def self.games group
		teams = Team.send("group_#{group}").to_a
		result = []		
		teams.combination(2).to_a.each do |game_array|
			result << Game.new(team1: game_array.first, team2: game_array.last, score_team1: 0, score_team2: 0)
		end
		result
	end

	def self.groups_stage
		result = []
		Team::GROUPS.each do |group|
  		result << Game.games(group).map(&:attributes)
  	end
  	result
  end

  def self.stage stage_number
		Game.where(stage: stage_number) 
	end
end
