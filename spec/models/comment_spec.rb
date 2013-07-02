require 'spec_helper'

describe Comment do
  before {@comment=FactoryGirl.create(:comment)}
  subject {@comment}

  it {should respond_to(:comment)}
  it {should respond_to(:book_id)}
  it {should respond_to(:user_id)}

  describe "attribute access validation" do

  	describe "comment" do
  		before {@comment.comment=""}
  		it {should_not be_valid}
  	end

  	describe "book_id" do
  		before {@comment.book_id=nil}
  		it {should_not be_valid}
  	end

  end
end
