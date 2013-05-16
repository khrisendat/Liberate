module CommentsHelper
	
	def bad_word(comment)
		words = ["shit", "fuck", "cunt","ass", "whore", "slut", "bitch", "linux"]
		words.each do |word|
			if comment.include? word
				return false
			end
		end
		return true
	end

	def bad_ratings(comments)
		
		if comments[0].rating < 20 and comments[1].rating < 20
			return -1
		elsif comments[0].rating > 80 and comments[1].rating > 80
			return 1
		else
			return 0
			
		end
	end 
end
