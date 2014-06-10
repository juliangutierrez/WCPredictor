class User < ActiveRecord::Base
	validates :name, presence: true
	# validates :team, presence: true
	# validates :striker, presence: true

	has_many :bets, dependent: :destroy
	accepts_nested_attributes_for :bets

	before_create :init_points

	def init_points
		points = 0
	end
	
	def update_points game
		bet = bets.find(game: game)
		points = points + 3 if guess_outcome?(bet, game)
		points = points + 2 if guess_score?(bet, game) 
	end

	def guess_outcome?(bet, game)
		(bet.winner == game.winner ||  bet.winner.nil? && game.winner.nil?)? true : false
	end

	def guess_score?(bet, game)
		(bet.score_team1 == game.actual_score_team1 && bet.score_team2 == game.actual_score_team2)? true : false
	end

	def self.update_points game
		User.all.each do |user|
			user.update_points game
		end
	end
end
