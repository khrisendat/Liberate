module ApplicationHelper

#any function here is automatically imported (or required) in the other files.
#this function will check whether the the page has a specific title, if it does not bad things won't happen.
	def full_title(page_title)
		base_title = "Ruby on Rails Tutorial Sample App"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

	def render_stars(rating)
  		StarsRenderer.new(rating, self).render_stars
	end


end
