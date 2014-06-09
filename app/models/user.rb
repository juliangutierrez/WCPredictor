class User < ActiveRecord::Base
	validates :name, presence: true

	has_one :bet, dependent: :destroy
end
