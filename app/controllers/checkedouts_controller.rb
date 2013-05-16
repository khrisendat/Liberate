class CheckedoutsController < ApplicationController

	before_filter :signed_in_user

	def create
		@checkedout = current_user.checkedouts.new(params[:checkedout])
		if @checkedout.save
			@checkedout.update_attributes(:datedue => Date.today)
			flash[:success] = "Book has been succesfully check out"
			@book=Book.find(params[:checkedout][:book_id])
			@books=Book.all			
			#the two lines below should be in a helper method or put into the model?
			@book.update_attributes(:is_checked_out => true) 
			##this is done in the case where the user who recieved the book is coming to check it out. 
			if @book.is_reserved 
				@book.update_attributes(:is_reserved=>false)
				@book.reserved.destroy
				checkout_remaining = current_user.checkedout_count  
				checkout_remaining += 1
				User.update_all("checkedout_count = " + checkout_remaining.to_s, ["users.id = ?", current_user.id])
			end
			#there is another way. This is a hack. update_attributes didn't work here because the sql call that it made didn't return anything.
			checkout_remaining = current_user.checkedout_count  
			checkout_remaining -= 1
			User.update_all("checkedout_count = " + checkout_remaining.to_s, ["users.id = ?", current_user.id])
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
