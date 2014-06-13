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
			correct_outcomes = correct_outcomes + 1 unless !guess_score?
		end
		if guess_score?(bet, game)
			new_points = new_points + 2
			correct_scores = correct_scores + 1
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
		User.all.sort_by(&:current_points).reverse
	end

	def self.build_chart
		LazyHighCharts::HighChart.new('graph') do |f|
		  f.title(:text => "Bolão campeão")
		  f.xAxis(:categories => Game.rounds)
		  f.series(:name => "Pontos", :yAxis => 0, :data => [14119, 5068, 4985, 3339, 2656])
		  f.series(:name => "Population in Millions", :yAxis => 1, :data => [310, 127, 1340, 81, 65])

		  f.yAxis [
		    {:title => {:text => "GDP in Billions", :margin => 70} },
		    {:title => {:text => "Population in Millions"}, :opposite => true},
		  ]

		  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
		  f.chart({:defaultSeriesType=>"column"})
		end
	end
	
end
