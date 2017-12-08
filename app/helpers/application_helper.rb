module ApplicationHelper
	def active_class(name)
		if (controller_name == name)
			'active' 
		else
			 ''
		end
	end
end
