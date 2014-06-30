class Game < ActiveRecord::Base
	belongs_to :team1, class_name: 'Team', foreign_key: 'team1_id'
	belongs_to :team2, class_name: 'Team', foreign_key: 'team2_id'

	after_update :update_users_points

	def done?
		actual_score_team1.present? && actual_score_team2.present?
	end

	def label
		"#{team1.name} X #{team2.name}"
	end

	def update_users_points
		User.update_points(self)
	end

	def winner
		return team1 if team1_won?
		return team2 if team2_won?		
	end

	def draw?
		actual_score_team1 == actual_score_team2
	end

	def team1_won?
		actual_score_team1 > actual_score_team2
	end

	def team2_won?
		actual_score_team1 < actual_score_team2
	end

	def score_team1
		actual_score_team1.present?? actual_score_team1 : '-'
	end

	def score_team2
		actual_score_team2.present?? actual_score_team2 : '-'
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
	
	def self.done_count
		Game.all.map(&:done?).count {|game| game}
	end

	def self.done
		Game.all.map {|g| g if g.done?}.compact
	end

	def self.not_done
		Game.all.map {|g| g unless g.done?}.compact
	end

	def self.next_games
		Game.not_done.sort_by(&:number)[0..3]
	end

	def self.previous_games		 
		Game.done.sort_by(&:updated_at)[Game.done_count - 4..Game.done_count]
	end
end
