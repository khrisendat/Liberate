module SessionsHelper
	
	def sign_in(user)
		#cookies are supplied by rails
		cookies.permanent[:remember_token] = user.remember_token
		self.current_user = user
	end

	def current_user=(user)
		@current_user=user
	end

	def current_user
		#|| = means to set @current_user to what is on the right only if it is undefined.
		@current_user ||= User.find_by_remember_token(cookies[:remember_token])
	end

	def current_user?(user)
		user == current_user
	end
	
	def signed_in?
		!current_user.nil?
	end

	def sign_out
    	self.current_user = nil
    	cookies.delete(:remember_token)
  	end

  	def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in" unless signed_in?
    end


end
