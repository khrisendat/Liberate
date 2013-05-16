module UsersHelper
# methods defined here are available to all of the users_controller fiels
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def ced
  end

  def checkfines(checkedouts)
  	checkedouts.each do |checkedout|
  		date = checkedout.created_at + 28.days
  		a = date.to_date != Date.today
  		if checkedout.active and a
  			redirect_to fines_path
  		end
  	end 
  end

end
