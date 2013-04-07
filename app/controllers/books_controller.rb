class BooksController < ApplicationController
	before_filter :signed_in_user, only: [:new, :create, :destroy, :update]
	before_filter :admin_user, only: [:new, :create, :destroy, :update]

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(params[:book])
		if @book.save
			flash[:success] = "Book has been succesfully created"
			redirect_to current_user
		else
			render 'new'
		end
	end

	def show
		@book = Book.find(params[:id])
	end

	def index
		@books = Book.all
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
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

	

end
