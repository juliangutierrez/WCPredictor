class Bet < ActiveRecord::Base
	belongs_to :game
	
	def winner
		return game.team1 if team1_won?
		return game.team2 if team2_won?		
	end

	def team1_won?
		score_team1 > score_team2
	end

	def team2_won?
		score_team1 < score_team2
	end

	def game_number
		game.number
	end

	def self.initialize_bets stage
		result = []
		Game.stage(stage).each do |game|
			result << Bet.new(game: game, score_team1: 0, score_team2: 0)
		end
		result
	end
	
end
