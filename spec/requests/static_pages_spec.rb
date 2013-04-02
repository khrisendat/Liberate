require 'spec_helper'

describe "StaticPages" do

#the command below tells rspec that the subject of the test is the page and thus the shoulds reference that.
subject{page}
  
  describe "Home page" do
  	before {visit root_path}
    it {should have_selector('title', :text=> 'Ruby on Rails Tutorial Sample App | Home')}
  end

  describe "Help page" do
  	before {visit help_path}
  	it {should have_selector('h1', :text => 'Help')}
  	it {should have_selector('title', :text=> 'Ruby on Rails Tutorial Sample App | Help')}
  end

  describe "About page" do
  	before {visit about_path}
  	it {should have_selector('h1', :text => 'About')}
  	it {should have_selector('title', :text=> 'Ruby on Rails Tutorial Sample App | About')}
  end

  describe "Contact page" do
  	before {visit contact_path}
    it {page.should have_selector('h1', text: 'Contact')}
    it {page.should have_selector('title', text: "Ruby on Rails Tutorial Sample App | Contact")}
  end

end
