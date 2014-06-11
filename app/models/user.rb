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
		new_points = new_points + 3 if guess_outcome?(bet, game)
		new_points = new_points + 2 if guess_score?(bet, game)
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

	def self.update_points game
		User.all.each do |user|
			user.update_points game
		end
	end

	def self.sorted	
		User.all.sort_by(&:current_points).reverse
	end
end
