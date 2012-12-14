# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	def title
		base="Freshdesk Demo Twitter Application"
		if @title.nil?
		  base
		else
			"#{base} | #{@title}"
		end
	end
	def gravatar(user)
      email_hash = Digest::MD5.hexdigest(user.email).downcase
      "http://www.gravatar.com/avatar/#{email_hash}"
  end
end
