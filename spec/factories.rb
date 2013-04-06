#the code is such that the first user created will have the name "Person 1" and email Person_1@example.com.
#It is incrimented as more users are created.

FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
    	admin true
    end
  end


  factory :book do
  	sequence(:name) { |n| "Book_#{n}" }
  	sequence(:author) { |n| "Author_#{n}"}
  	sequence(:description) { |n| "This book is ok_#{n}"}
  	sequence(:image_url) { |n| "http://picture.png_#{n}"}
  end
end



