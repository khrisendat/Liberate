require 'spec_helper'

describe User do
	
	before {@user=User.new(name:"bob", email:"bob@example.com", password: "foobar", password_confirmation: "foobar")}
	subject{@user}
	#checks if the object is valid
	it {should respond_to(:email)}
	it {should respond_to(:name)}
	it {should respond_to(:password_digest)}
	it {should respond_to(:password)}
	it {should respond_to(:password_confirmation)}
	it {should respond_to(:remember_token)}
	it {should respond_to(:authenticate) }
	#look up the authenticate method. I don't fully understand it.
	it { should respond_to(:admin)}

	it {should be_valid}
	#can use the be_admin convention for booleans for this model.
	it {should_not be_admin}

	describe "with admin attribute set to 'true'" do
    	before do
      		@user.save!
      		@user.toggle!(:admin)
    	end
      it { should be_admin }
 	 end
	
	describe "when name is present" do
		before { @user.name = " "}
		it {should_not be_valid}
	end

	describe "when email is present" do
		before {@user.email = "" }
		it {should_not be_valid}
	end

	describe "when email is already taken" do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.email = @user.email.upcase
			user_with_same_email.save
		end

		it {should_not be_valid}
	end

	describe "when password is not present" do
		before do
			@user.password = @user.password_confirmation = " "
		end
		it {should_not be_valid}
	end

	describe "when password does not match password_confirmation" do
		#mismatch seems to be a keyword
		before { @user.password_confirmation = "mismatch"}
		it {should_not be_valid}
	end
	
	describe "with a password that's too short" do
    	before { @user.password = @user.password_confirmation = "a" * 5 }
    	it { should be_invalid }
  	end

	describe "when password_confirmation is nil" do
		before {@user.password_confirmation = nil}
		it {should_not be_valid}
	end

	

	describe "return value of authenticate method" do
		before {@user.save}
		# let is used here so that found user can be used in multiple invocation. 
		let (:found_user) {User.find_by_email(@user.email)}

		describe "with valid password" do
			it { should == found_user.authenticate(@user.password)}
		end

		describe "with invalid password" do
			let(:user_for_invalid_password) { found_user.authenticate("invalid")}
			it{ should_not == user_for_invalid_password }
			#specify is equivalent to it. It is just used here to make the code more human readable.
			specify { user_for_invalid_password.should be_false }
		end
	end

	describe "remember token" do
		before {@user.save}
		#its is different from "it" because it applies to subsequent test after the given subject of the test is mentioned
		its(:remember_token){should_not be_blank}
	end

	it {should respond_to}
end
