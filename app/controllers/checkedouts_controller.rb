class CheckedoutsController < ApplicationController

	before_filter :signed_in_user

	def create
		@checkedout = current_user.checkedouts.new(params[:checkedout])
		if @checkedout.save
			flash[:success] = "Book has been succesfully check out"
			@book=Book.find(params[:checkedout][:book_id])
			#show_book_path can be shown at @book
			redirect_to @book
		else
			#this will be changed later
			#errors will be processed in the view
			#redirect_to @book
			@book= params[:book]
			flash[:error] = "Book has not been succesfully checked out"
			redirect_to @book
		end
	end

end
