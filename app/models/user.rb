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

	def guess_outcome? bet, game
		if (bet.winner == game.winner ||  bet.winner.nil? && game.winner.nil?)? return true : return false
	end

	def guess_score? bet, game
		if (bet.score_team1 == game.actual_score_team1 && bet.score_team2 == game.actual_score_team2)? return true : return false
	end

	def self.update_points game
		User.all.each do |user|
			user.update_points game
		end
	end
end
