
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
      image_url = "http://i.imgur.com/WSJIMk7.png"
      description = "description-#{n+1}"
      isbn = "1234#{n}"
      is_checked_out = false
      Book.create!(name: name, author: author, image_url: image_url, description: description, isbn: isbn, is_checked_out: false)
    end

    author = "Bill James"
    name = "Baseball Book"
    image_url = "http://www.slate.com/content/dam/slate/blogs/bad_astronomy/2012/12/best_of_2012_photos/SDO_arch.jpg.CROP.article920-large.jpg"
    description = "lalalallalalalal"
    isbn = 12345
    is_checked_out = false
    Book.create!(name: name, author: author, image_url: image_url, description: description, isbn: isbn, is_checked_out: false)

  end
end