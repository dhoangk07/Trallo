module DashboardsHelper
	def	initial_name(user)
		if user.present? && user.first_name.present? && user.last_name.present?
			user.last_name[0,1].upcase + user.first_name[0,1].upcase
		end
	end
end
