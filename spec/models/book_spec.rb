require 'spec_helper'

describe Book do

  before {@book=FactoryGirl.create(:book)}
  subject {@book}

  it {should respond_to(:name)}
  it {should respond_to(:author)}
  it {should respond_to(:image_url)}
  it {should respond_to(:description)}
  it {should be_valid}

  describe "attribute validation" do
  	describe "name" do
  		before {@book.name=""}
  		it {should_not be_valid}
  	end

  	describe "author" do
  		before {@book.author=""}
  		it {should_not be_valid}
  	end

  	describe "image_url" do
  		before {@book.image_url=""}
  		it {should_not be_valid}
  	end

  	describe "description" do
  		before {@book.description=""}
  		it {should_not be_valid}
  	end
  end

end
