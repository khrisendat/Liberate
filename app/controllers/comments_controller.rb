class CommentsController < ApplicationController

	before_filter :signed_in_user

# instance variables are not passed within classes. 
	def create
		@comment = current_user.comments.new(params[:comment])
		if @comment.save
			flash[:success] = "Comment has been succesfully created"
			@book=Book.find(params[:comment][:book_id])
			#show_book_path can be shown at @book
			redirect_to @book
		else
			#this will be changed later
			#errors will be processed in the view
			#redirect_to @book
			@book= params[:book]
			flash[:error] = "Comment has not been succesfully created"
			redirect_to @book
		end
	end




end
