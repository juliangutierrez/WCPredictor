class User < ActiveRecord::Base
	validates :name, presence: true
	# validates :team, presence: true
	# validates :striker, presence: true

	has_many :bets, dependent: :destroy
	accepts_nested_attributes_for :bets
end
