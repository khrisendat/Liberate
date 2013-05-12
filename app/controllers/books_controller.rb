class BooksController < ApplicationController
	before_filter :signed_in_user, only: [:new, :create, :destroy, :update]
	before_filter :admin_user, only: [:new, :create, :destroy, :update]

	#displays the new form
	def new
		@book = Book.new
	end

	#creates the form upon the submit button press
	def create
		#this line takes the stuff from the form parameters
		@book = Book.new(params[:book])
		if @book.save
			flash[:success] = "Book has been succesfully created"
			redirect_to current_user
		else
			render 'new'
		end
	end

	def show
		#so params[:id] takes the parameter :id from the url string. 
		@book = Book.find(params[:id])
		@checkedout = current_user.checkedouts.new if signed_in?
		@comment = current_user.comments.new if signed_in?
		@comments = @book.comments.all
		
	end

	def index
		@books = Book.all
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		# not sure why the stuff in edit is not be carried over to update.
		# that is why I had to include the first line here. 
		@book = Book.find(params[:id])
		if @book.update_attributes(params[:book])
      	   	flash[:success] = "Book Updated"
      		redirect_to current_user
    	else
      		render 'edit'
    	end
	end

	def destroy
		Book.find(params[:id]).destroy
    	flash[:success]="Book removed"
    	redirect_to books_url
	end

	def search
		if params[:search]
  			@books = Book.search(params[:search])
  		else
  			@books = Book.all
  		end
	end
	

end
