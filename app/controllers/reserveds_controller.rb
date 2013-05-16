class ReservedsController < ApplicationController

	def create
		@reserved = current_user.reserveds.new(params[:reserved])
		if @reserved.save
			flash[:success] = "Book has been succesfully reserved"
			@book=Book.find(params[:reserved][:book_id])
			@books=Book.all	
			@book.update_attributes(:is_reserved => true) 
			checkout_remaining = current_user.checkedout_count  
			checkout_remaining -= 1
			User.update_all("checkedout_count = " + checkout_remaining.to_s, ["users.id = ?", current_user.id])
			redirect_to @book
		else
			@book= params[:book]
			flash[:error] = "Book has not been succesfully reserved."
			redirect_to @book
		end



	end
	
end
