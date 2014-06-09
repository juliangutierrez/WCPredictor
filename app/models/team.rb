class Team < ActiveRecord::Base
	GROUPS = %w(A B C D E F G H)
	GROUPS.each do |group|
		scope "group_#{group}".to_sym, -> { where(group: group) }
	end

end
