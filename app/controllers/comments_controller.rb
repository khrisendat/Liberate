class CommentsController < ApplicationController

	before_filter :signed_in_user

	def bad_word(comment)
		words = ["shit", "fuck", "cunt", "ass", "whore", "fag", "slut", "microsoft"]
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

	def average(book)
		avg = 0
		book.comments do |comment|
			avg += comment.rating
		end
		avg /= comment.length
	end

# instance variables are not passed within classes. 
	def create
		@comment = current_user.comments.new(params[:comment])
		@book=Book.find(params[:comment][:book_id])
		bw = bad_word(@comment.comment)
		comments = current_user.comments.reorder('created_at DESC').limit(2)

		if not bw
			flash[:error] = "Profanity Detected.  You have received one warning.  Your comment and rating were not saved"
			redirect_to @book

		elsif comments.length >= 2
			if bad_ratings(comments) == -1 and @comment.rating < 20
				flash[:error] = "You have made too many low ratings.  Your comment and rating were not saved."
				comments[0].destroy
				comments[1].destroy
				redirect_to @book
			elsif bad_ratings(comments) == 1 and @comment.rating > 80
				flash[:error] = "You have made too many high ratings.  Your comment and rating were not saved."
				comments[0].destroy
				comments[1].destroy
				redirect_to @book
			elsif @comment.save
				flash[:success] = "Comment has been succesfully created"
				redirect_to @book
			else
				flash[:error] = "Comment has not been succesfully created"
				redirect_to @book
			end

		elsif @comment.save
			flash[:success] = "Comment has been succesfully created"
			#show_book_path can be shown at @book
			redirect_to @book			
		else
			#this will be changed later
			#errors will be processed in the view
			#redirect_to @book
			flash[:error] = "Comment has not been succesfully created"
			redirect_to @book
		end


	end

end
