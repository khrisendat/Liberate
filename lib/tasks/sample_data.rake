
#this file sets the actions rake db:populate command
namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    admin.toggle!(:admin)
    
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    99.times do |n|
      author = "author=#{n}"
      name = "xample-#{n+1}"
      image_url = "http://picture.-#{n+1}.png"
      description = "description-#{n+1}"
      Book.create!(name: name, author: author, image_url: image_url, description: description)
    end
  end
end