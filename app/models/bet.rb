class Bet < ActiveRecord::Base
	belongs_to :game

	def self.initialize_bets stage
		result = []
		Game.stage(stage).each do |game|
			result << Bet.new(game: game, score_team1: 0, score_team2: 0)
		end
		result
	end
	
end
