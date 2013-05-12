class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_filter :correct_user, only: [:edit,:update]
  before_filter :admin_user, only: :destroy
  
  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
    @checkedouts = @user.checkedouts.all
  end

  def create
    #params[:user] here pulls all the object and all of it's attributes from the url.
    #@user = User.new(params[:user]) is eqivalent to @user = User.new(name: "Foo Bar", email: "foo@invalid", password: "foo", password_confirmation: "bar")
  	@user = User.new(params[:user])
  	if @user.save
  		flash[:success] = "Your account has been successfully created. Welcome!"
		#success to create user
      sign_in @user
		  redirect_to @user
    #signin is not here as it is in the session controller create method
    # thus when an account is first created "Account" does not appear since 
    # current user is not set. I added sign_in @user here from the sessions_helper.
    #Apparently functions from there can be used here. 
	  else
	 	#fail to create user
  		render 'new'
  	end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile Updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @users = User.all
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success]="User removed"
    redirect_to users_url
    #redirect_to users_path does the same
  end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path, notice: "Not Authorized!" unless current_user?(@user)
    end
end
