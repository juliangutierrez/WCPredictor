class User < ActiveRecord::Base
	validates :name, presence: true
	
	has_many :bets, dependent: :destroy
	belongs_to :champion, class_name: 'Team'
	accepts_nested_attributes_for :bets

	before_create :init_points

	serialize :points, Array

	def init_points
		points << 0
	end

	def update_points game
		bet = bets.where(game: game).first
		new_points = points.last
		
		if guess_outcome?(bet, game)
			new_points = new_points + 3			
			self.correct_outcomes = self.correct_outcomes + 1
		end
		
		if guess_score?(bet, game)
			new_points = new_points + 2
			self.correct_scores = self.correct_scores + 1
		end
		
		if game.stage != 1 && game.draw?
			if bet.draw?
				new_points = new_points + 2 if bet.winner_by_penalties == game.winner_by_penalties
			elsif game.winner_by_penalties == bet.winner
				new_points = new_points + 2
				self.correct_outcomes = self.correct_outcomes + 1
			end
		elsif game.stage != 1 && bet.draw? && bet.winner_by_penalties == game.winner
			new_points = new_points + 2
			self.correct_outcomes = self.correct_outcomes + 1			
		end

		points << new_points

		save
	end

	def current_points
		points.last
	end

	def guess_outcome?(bet, game)
		(bet.winner == game.winner ||  bet.draw? && game.draw?)? true : false
	end

	def guess_score?(bet, game)
		(bet.score_team1 == game.actual_score_team1 && bet.score_team2 == game.actual_score_team2)? true : false
	end

	def correct_outcomes_percent
		correct_outcomes.to_f / Game.done_count
	end

	def correct_scores_percent
		correct_scores.to_f / Game.done_count
	end

	def initialize_stage stage
		self.bets = self.bets + Bet.initialize_bets(stage)
	end

	def bets_by_stage stage
		bets.stage stage
	end

	def has_draws? stage
		bets_by_stage(stage).any? { |bet| bet.draw? && !bet.game.done? }
	end

	def self.update_points game
		User.all.each do |user|
			user.update_points game
		end
	end

	def self.sorted			
		User.all.sort_by{|user| [user.current_points, user.correct_scores]}.reverse
	end

	def self.build_chart_series
		User.all.inject([]){|result, user| result << {name: user.name, data: user.points} } 
	end
end
