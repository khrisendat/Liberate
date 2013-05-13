module BooksHelper

	def checkedoutcountcheck
		if current_user.checkedout_count <= 0
			return false
		else
			return true
		end
	end
end
