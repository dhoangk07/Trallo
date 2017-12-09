module ApplicationHelper
	def active_class(name)
		if (controller_name == name)
			'active' 
		else
			 ''
		end
	end

	def background_url
		if (action_name == "show") && (controller_name == "boards")
			@board.photo.url(:original)
		else
			 ''
		end
	end

end
