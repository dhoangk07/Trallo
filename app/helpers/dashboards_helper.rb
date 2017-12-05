module DashboardsHelper
	def	initial_name(user)
		user.last_name[0,1].upcase + user.first_name[0,1].upcase
	end
end
