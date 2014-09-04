module JobsHelper
	def display_notification
		unless current_user.pending_notification == nil || current_user.pending_notification == 0
			content_tag :span, current_user.pending_notification, class: "message-badge badge"
		else
			""
		end
	end
	
	def grouped_locations
		Array(Location.all.map{|f| [f.city, f.region]}).group_by(&:second)
	end
end
