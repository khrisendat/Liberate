require 'set'

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
    @reserveds = @user.reserveds.all

    @checkedouts.each do |checkedout|
      a = Date.today > checkedout.datedue + 28.days
      if checkedout.active and a
        @fine=Fine.create(checkedout_id: checkedout.id, amount: 0.5)
        @user.update_attributes(:balance => @user.balance + 1)
      end
    end

    @books = Set.new
    recommends = @user.checkedouts.reorder('created_at DESC').limit(2)
    a=Book.find(recommends[0].book_id)
    b=Book.find(recommends[1].book_id)

    aname = Book.search(a.name)
    aauthor = Book.search(a.author)
    @books.merge(aname)
    @books.merge(aauthor)

    bname = Book.search(b.name)
    bauthor = Book.search(b.name)
    @books.merge(bname)
    @books.merge(bauthor)
    
    @books = @books.to_a

    if @books.count > 5
      @books = @books.last(5)
    end
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

  def suspend
     @user=User.find(params[:id])

      if !@user.is_suspended
        #@user.update_attributes(:is_suspended => true)
        User.update_all("is_suspended = 'true'", ["users.id = ?", @user.id])
      else
        User.update_all("is_suspended = 'false'", ["users.id = ?", @user.id])
      end
     @users = User.all
     render 'index'
  end


  def return_book
    @book = Book.find(params[:book_id])
    @book.update_attributes(:is_checked_out => false)

    @checkedout = Checkedout.find(params[:checkedout_id])
    @checkedout.update_attributes(:active => false)

    checkout_remaining = current_user.checkedout_count  
    checkout_remaining += 1
    User.update_all("checkedout_count = " + checkout_remaining.to_s, ["users.id = ?", current_user.id])
    
    @user=User.find(params[:id])
    a= @user.checkedouts.order("created_at DESC").limit(5)
    if a.length >= 5
      if !a[0].fine and !a[1].fine and !a[2].fine and !a[3].fine and !a[4].fine 
        User.update_all("is_vip = 'true'" , ["users.id = ?", @user.id])
      end
    end
    @user=User.find(params[:id])
    @checkedouts = @user.checkedouts.all
    @reserveds = @user.reserveds.all
    render 'show'
  end


  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path, notice: "Not Authorized!" unless current_user?(@user) || current_user.admin?
    end
end
