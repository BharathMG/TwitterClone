# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	def title
		base="Sample Application"
		if @title.nil?
		  base
		else
			"#{base} | #{@title}"
		end
	end
end
