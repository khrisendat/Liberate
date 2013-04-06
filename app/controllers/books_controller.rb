class BooksController < ApplicationController
	before_filter :signed_in_user, only: [:new, :create, :destroy, :update]
	before_filter :admin_user, only: [:new, :create, :destroy, :update]


	def new
	end

	def show
		@book =Book.find(params[:id])
	end

	def index
		@books=Book.all
	end

	def create
	end

	def destroy
	end

	def update
	end


end
