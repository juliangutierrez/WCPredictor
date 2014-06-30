class Bet < ActiveRecord::Base
	belongs_to :game
	belongs_to :winner_by_penalties, class_name: 'Team', foreign_key: 'winner_id'
		
	after_save :nulify_winner_by_penalties
	
	def winner
		return game.team1 if team1_won?
		return game.team2 if team2_won?		
	end

	def draw?
		score_team1 == score_team2
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

	def stage
		game.stage
	end

	def nulify_winner_by_penalties
		self.winner_by_penalties = nil unless draw?
	end

	def self.initialize_bets stage	
		Game.stage(stage).map do |game|
			Bet.new(game: game, score_team1: 0, score_team2: 0)
		end		
	end
	
	def self.stage stage
		select { |bet| bet.stage == stage }
	end
end
