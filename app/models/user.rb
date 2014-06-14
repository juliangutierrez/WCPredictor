class User < ActiveRecord::Base
	validates :name, presence: true
	# validates :team, presence: true
	# validates :striker, presence: true

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
		points << new_points

		save
	end

	def current_points
		points.last
	end

	def guess_outcome?(bet, game)
		(bet.winner == game.winner ||  bet.winner.nil? && game.winner.nil?)? true : false
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
