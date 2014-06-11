module UserHelper
	def rowspan? users, index
		return true if index == 0 		
		return true if users[index].current_points != users[index - 1].current_points 		
	end

	def row_span_for_score_table users, points
		User.sorted.map { |user| user if  user.current_points == points }.compact.size
	end
end
