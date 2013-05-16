
#this file sets the actions rake db:populate command
namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Admin User",
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
    
    #No.51
    author = "Claire Messud"
    name = "The Woman Upstairs"
    image_url = "http://ecx.images-amazon.com/images/I/41wxfOqfBAL._BO2,204,203,200_PIsitb-sticker-arrow-click,TopRight,35,-76_SX225_SY300_CR,0,0,225,300_SH20_OU01_.jpg"
    description = "From the New York Times best-selling author of The Emperors Children, a masterly new novel: the riveting confession of a woman awakened, transformed and betrayed by a desire for a world beyond her own."
    isbn = "9780307596901"
    is_checked_out = false
    Book.create!(name: name, author: author, image_url: image_url, description: description, isbn: isbn, is_checked_out: false)

    #No.52
author = "Eric Carle"
name = "The Very Hungry Caterpillar"
image_url = "http://ecx.images-amazon.com/images/I/41xfWAKej8L._BO2,204,203,200_PIsitb-sticker-arrow-click,TopRight,35,-76_SX225_SY300_CR,0,0,225,300_SH20_OU01_.jpg"
description = "The very hungry caterpillar literally eats his way through the pages of the book?and right into your childs heart...?Mothers Manual Gorgeously illustrated, brilliantly innovative...?The New York Times Book Review"
isbn = "978-0399226908"
is_checked_out = false
Book.create!(name: name, author: author, image_url: image_url, description: description, isbn: isbn, is_checked_out: false)

#No.53
author = "Jeffrey Brown"
name = "Star Wars: Vader's Little Princess"
image_url = "http://ecx.images-amazon.com/images/I/51IEBZyyppL._SX225_.jpg"
description = "In this irresistibly funny follow-up to the breakout bestseller Darth Vader and Son, Vader?Sith Lord and leader of the Galactic Empire?now faces the trials, joys, and mood swings of raising his daughter Leia as she grows from a sweet little girl into a rebellious teenager. Smart and funny illustrations by artist Jeffrey Brown give classic Star Wars moments a twist by bringing these iconic family relations together under one roof. From tea parties to teaching Leia how to fly a TIE fighter, regulating the time she spends talking with friends via R2-D2's hologram, and making sure Leia doesn't leave the house wearing only the a skirted metal bikini, Vader's parenting skills are put hilariously to the test."
isbn = "978-1452118697"
is_checked_out = false
Book.create!(name: name, author: author, image_url: image_url, description: description, isbn: isbn, is_checked_out: false)

#No.54
author = "Katherine Applegate, Patricia Castelao "
name = "The One and Only Ivan"
image_url = "http://ecx.images-amazon.com/images/I/51LL67oVNOL._BO2,204,203,200_PIsitb-sticker-arrow-click,TopRight,35,-76_SX225_SY300_CR,0,0,225,300_SH20_OU01_.jpg"
description = "Ivan is an easygoing gorilla. Living at the Exit 8 Big Top Mall and Video Arcade, he has grown accustomed to humans watching him through the glass walls of his domain. He rarely misses his life in the jungle. In fact, he hardly ever thinks about it at all.
Instead, Ivan thinks about TV shows hess seen and about his friends Stella, an elderly elephant, and Bob, a stray dog. But mostly Ivan thinks about art and how to capture the taste of a mango or the sound of leaves with color and a well-placed line."
isbn = "978-0061992254"
is_checked_out = false
Book.create!(name: name, author: author, image_url: image_url, description: description, isbn: isbn, is_checked_out: false)

#No.55
author = "John le Carre"
name = "A Delicate Truth: A Novel"
image_url = "http://ecx.images-amazon.com/images/I/418emQnqA5L._BO2,204,203,200_PIsitb-sticker-arrow-click,TopRight,35,-76_SX225_SY300_CR,0,0,225,300_SH20_OU01_.jpg"
description = "A counter-terrorist operation, codenamed Wildlife, is being mounted on the British crown colony of Gibraltar.  Its purpose: to capture and abduct a high-value jihadist arms buyer. Its authors: an ambitious Foreign Office Minister, a private defense contractor who is also his bosom friend, and a shady American CIA operative of the evangelical far-right. So delicate is the operation that even the Ministerss personal private secretary, Toby Bell, is not cleared for it.
"
isbn = "978-0670014897"
is_checked_out = false
Book.create!(name: name, author: author, image_url: image_url, description: description, isbn: isbn, is_checked_out: false)

#No.56
author = "Kimberly Snyder"
name = "The Beauty Detox Foods: Discover the Top 50 Beauty Foods That Will Transform Your Body and Reveal a More Beautiful You"
image_url = "http://ecx.images-amazon.com/images/I/51z-pCVdrbL._BO2,204,203,200_PIsitb-sticker-arrow-click,TopRight,35,-76_SX225_SY300_CR,0,0,225,300_SH20_OU01_.jpg"
description = "In her bestselling book, The Beauty Detox Solution, Kimberly Snyder?one of Hollywood's top celebrity nutritionists and beauty experts?shared the groundbreaking program that keeps her A-list clientele in red-carpet shape. Now you can get the star treatment with this guide to the top 50 beauty foods that will make you more beautiful from the inside out. Stop wasting your money on fancy, expensive beauty products and get real results, while spending less at your neighborhood grocery."
isbn = "978-0373892648"
is_checked_out = false
Book.create!(name: name, author: author, image_url: image_url, description: description, isbn: isbn, is_checked_out: false)

#No.57
author = "T. Colin Campbell, Howard Jacobson"
name = "Whole: Rethinking the Science of Nutrition"
image_url = "http://ecx.images-amazon.com/images/I/51MCK4mKZWL._BO2,204,203,200_PIsitb-sticker-arrow-click,TopRight,35,-76_SX225_SY300_CR,0,0,225,300_SH20_OU01_.jpg"
description = "What happens when you eat an apple? The answer is vastly more complex than you imagine.

Every apple contains thousands of antioxidants whose names, beyond a few like vitamin C, are unfamiliar to us, and each of these powerful chemicals has the potential to play an important role in supporting our health. They impact thousands upon thousands of metabolic reactions inside the human body. But calculating the specific influence of each of these chemicals isnst nearly sufficient to explain the effect of the apple as a whole. Because almost every chemical can affect every other chemical, there is an almost infinite number of possible biological consequences."
isbn = "978-1937856243"
is_checked_out = false
Book.create!(name: name, author: author, image_url: image_url, description: description, isbn: isbn, is_checked_out: false)

#No.58
author = "E. L. James"
name = "Fifty Shades Darker: Book Two of the Fifty Shades Trilogy"
image_url = "http://ecx.images-amazon.com/images/I/51Afk0Wpa6L._BO2,204,203,200_PIsitb-sticker-arrow-click,TopRight,35,-76_SX225_SY300_CR,0,0,225,300_SH20_OU01_.jpg"
description = "Daunted by the singular tastes and dark secrets of the beautiful, tormented young entrepreneur Christian Grey, Anastasia Steele has broken off their relationship to start a new career with a Seattle publishing house. 
 
But desire for Christian still dominates her every waking thought, and when he proposes a new arrangement, Anastasia cannot resist. They rekindle their searing sensual affair, and Anastasia learns more about the harrowing past of her damaged, driven and demanding Fifty Shades."
isbn = "978-0345803498"
is_checked_out = false
Book.create!(name: name, author: author, image_url: image_url, description: description, isbn: isbn, is_checked_out: false)

#No.59
author = "Kate Atkinson"
name = "Life After Life: A Novel"
image_url = "http://ecx.images-amazon.com/images/I/416zyWJHZYL._BO2,204,203,200_PIsitb-sticker-arrow-click,TopRight,35,-76_SX225_SY300_CR,0,0,225,300_SH20_OU01_.jpg"
description = "What if you could live again and again, until you got it right? 

On a cold and snowy night in 1910, Ursula Todd is born to an English banker and his wife. She dies before she can draw her first breath. On that same cold and snowy night, Ursula Todd is born, lets out a lusty wail, and embarks upon a life that will be, to say the least, unusual. For as she grows, she also dies, repeatedly, in a variety of ways, while the young century marches on towards its second cataclysmic world war. "
isbn = "978-0316176484"
is_checked_out = false
Book.create!(name: name, author: author, image_url: image_url, description: description, isbn: isbn, is_checked_out: false)

#No.1
author = "Dan Brown"
name = "Inferno"
image_url = "http://ecx.images-amazon.com/images/I/51i1GQblq4L._SY300_.jpg"
description = "In his international blockbusters The Da Vinci Code, Angels & Demons, and The Lost Symbol, Dan Brown masterfully fused history, art, codes, and symbols. In this riveting new thriller, Brown returns to his element and has crafted his highest-stakes novel to date."
isbn = "978-0385537858"
is_checked_out = false
Book.create!(name: name, author: author, image_url: image_url, description: description, isbn: isbn, is_checked_out: false)

#No.2
author = "F. Scott Fitzgerald"
name = "The Great Gatsby"
image_url = "http://ecx.images-amazon.com/images/I/51SyWimt1SL._BO2,204,203,200_PIsitb-sticker-arrow-click,TopRight,35,-76_SX225_SY300_CR,0,0,225,300_SH20_OU01_.jpg"
description = "The Great Gatsby, F. Scott Fitzgeralds third book, stands as the supreme achievement of his career. This exemplary novel of the Jazz Age has been acclaimed by generations of readers. The story of the fabulously wealthy Jay Gatsby and his love for the beautiful Daisy Buchanan, of lavish parties on Long Island at a time when The New York Times noted gin was the national drink and sex the national obsession, it is an exquisitely crafted tale of America in the 1920s.
The Great Gatsby is one of the great classics of twentieth-century literature."
isbn = "978-0743273565"
is_checked_out = false
Book.create!(name: name, author: author, image_url: image_url, description: description, isbn: isbn, is_checked_out: false)

#No.3
author = "Rick Atkinson"
name = "The Guns at Last Light: The War in Western Europe"
image_url = "http://ecx.images-amazon.com/images/I/51tfTau2c9L._SY300_.jpg"
description = "The magnificent conclusion to Rick Atkinsons acclaimed Liberation Trilogy about the Allied triumph in Europe during World War II"
isbn = "978-0805062908"
is_checked_out = false
Book.create!(name: name, author: author, image_url: image_url, description: description, isbn: isbn, is_checked_out: false)

#No.4
author = "Dr. Seuss"
name = "Oh, the Places Youll Go!"
image_url = "http://ecx.images-amazon.com/images/I/51mgPj7UkgL._BO2,204,203,200_PIsitb-sticker-arrow-click,TopRight,35,-76_SX225_SY300_CR,0,0,225,300_SH20_OU01_.jpg"
description = "Dr. Seusss wonderfully wise graduation speech is the perfect send-off for children starting out in the world, be they nursery, high school, or college grads! With his trademark use of humorous verse and illustrations, Dr. Seuss addresses the the ups and downs life presents while encouraging readers to find the success that lies within them all."
isbn = "978-0679805274"
is_checked_out = false
Book.create!(name: name, author: author, image_url: image_url, description: description, isbn: isbn, is_checked_out: false)

#No.5
author = "Esther Gokhale"
name = "8 Steps to a Pain-Free Back: Natural Posture Solutions for Pain in the Back, Neck, Shoulder, Hip, Knee, and Foot"
image_url = "http://ecx.images-amazon.com/images/I/51eioTx77IL._BO2,204,203,200_PIsitb-sticker-arrow-click,TopRight,35,-76_SX225_SY300_CR,0,0,225,300_SH20_OU01_.jpg"
description = "Nearly 90% of American adults suffer from back pain, and the number continues to climb. Why does this condition affect so many people in the industrialized world, while in some countries only 5% of adults report back pain In a quest to find the root cause of back pain, Esther Gokhale studied at the Aplomb Institute in Paris and traveled to parts of the world where back pain is virtually unknown. Her research took her to remote Burkina Faso, rural Portugal, and fishing villages in Brazil."
isbn = "978-0979303609"
is_checked_out = false
Book.create!(name: name, author: author, image_url: image_url, description: description, isbn: isbn, is_checked_out: false)

#No.6
author = "Sheryl Sandberg"
name = "Lean In: Women, Work, and the Will to Lead"
image_url = "http://ecx.images-amazon.com/images/I/41TknOCIZWL._BO2,204,203,200_PIsitb-sticker-arrow-click,TopRight,35,-76_SX225_SY300_CR,0,0,225,300_SH20_OU01_.jpg"
description = "Thirty years after women became 50 percent of the college graduates in the United States, men still hold the vast majority of leadership positions in government and industry. This means that womens voices are still not heard equally in the decisions that most affect our lives. In Lean In, Sheryl Sandberg examines why womens progress in achieving leadership roles has stalled, explains the root causes, and offers compelling, commonsense solutions that can empower women to achieve their full potential."
isbn = "978-0385349949"
is_checked_out = false
Book.create!(name: name, author: author, image_url: image_url, description: description, isbn: isbn, is_checked_out: false)

#No.7
author = "George R.R. Martin"
name = "A Song of Ice and Fire, Books 1-4 (A Game of Thrones / A Feast for Crows / A Storm of Swords / Clash of Kings)"
image_url = "http://ecx.images-amazon.com/images/I/51rzXT-PMlL._BO2,204,203,200_PIsitb-sticker-arrow-click,TopRight,35,-76_SX225_SY300_CR,0,0,225,300_SH20_OU01_.jpg"
description = "George R. R. Martins A Song of Ice and Fire series has become, in many ways, the gold standard for modern epic fantasy. Martin--dubbed the American Tolkien by Time magazine--has created a world that is as rich and vital as any piece of historical fiction, set in an age of knights and chivalry and filled with a plethora of fascinating, multidimensional characters that you love, hate to love, or love to hate as they struggle for control of a divided kingdom. It is this very vitality that has led it to be adapted as the HBO miniseries Game of Thrones.

This boxed set includes the following novels:
A Game of Thrones
A Clash of Kings
A Storm of Swords
A Feast for Crows"
isbn = "978-0345529053"
is_checked_out = false
Book.create!(name: name, author: author, image_url: image_url, description: description, isbn: isbn, is_checked_out: false)

#No.8
author = "Phil Robertson"
name = "Happy, Happy, Happy: My Life and Legacy as the Duck Commander"
image_url = "http://ecx.images-amazon.com/images/I/61rSjSmiZ1L._BO2,204,203,200_PIsitb-sticker-arrow-click,TopRight,35,-76_SX225_SY300_CR,0,0,225,300_SH20_OU01_.jpg"
description = "LIVING THE DREAM
Duck callsthough the source of his livelihoodare not what makes Phil Robertson the man he is today. When asked what matters in his life, hes quick to say, Faith, family, ducksin that order.

It isnt often that a person can live a dream, but Phil Robertson, aka The Duck Commander, has proven that it is possible with vision, hard work, helping hands, and an unshakable faith in the Almighty. Phils is the remarkable story of one man who followed the call he received from God and soon after invented a duck call that would begin an incredible journey to the life he had always dreamed of for himself and his family. In the love of his country, his family, and his maker, Phil has finally found the ingredients to the good life he always wanted."
isbn = "978-1476726090"
is_checked_out = false
Book.create!(name: name, author: author, image_url: image_url, description: description, isbn: isbn, is_checked_out: false)

#No.9
author = "David Sedaris"
name = "Lets Explore Diabetes with Owls"
image_url = "http://ecx.images-amazon.com/images/I/51loWdmrXCL._BO2,204,203,200_PIsitb-sticker-arrow-click,TopRight,35,-76_SX225_SY300_CR,0,0,225,300_SH20_OU01_.jpg"
description = "A guy walks into a bar car and...

From here the story could take many turns. When this guy is David Sedaris, the possibilities are endless, but the result is always the same: he will both delight you with twists of humor and intelligence and leave you deeply moved."
isbn = "978-0316154697"
is_checked_out = false
Book.create!(name: name, author: author, image_url: image_url, description: description, isbn: isbn, is_checked_out: false)

#No.10
author = "Khaled Hosseini"
name = "And the Mountains Echoed"
image_url = "http://ecx.images-amazon.com/images/I/51x8ag3rMHL._SY300_.jpg"
description = "An unforgettable novel about finding a lost piece of yourself in someone else.

Khaled Hosseini, the #1 New York Timesbestselling author of The Kite Runner and A Thousand Splendid Suns, has written a new novel about how we love, how we take care of one another, and how the choices we make resonate through generations. In this tale revolving around not just parents and children but brothers and sisters, cousins and caretakers, Hosseini explores the many ways in which families nurture, wound, betray, honor, and sacrifice for one another; and how often we are surprised by the actions of those closest to us, at the times that matter most. Following its characters and the ramifications of their lives and choices and loves around the globefrom Kabul to Paris to San Francisco to the Greek island of Tinosthe story expands gradually outward, becoming more emotionally complex and powerful with each turning page."
isbn = "978-1594631764"
is_checked_out = false
Book.create!(name: name, author: author, image_url: image_url, description: description, isbn: isbn, is_checked_out: false)
    99.times do |n|
      author = "author=#{n}"
      name = "xample-#{n+1}"
      image_url = "http://i.imgur.com/WSJIMk7.png"
      description = "description-#{n+1}"
      isbn = "1234#{n}"
      is_checked_out = false
      Book.create!(name: name, author: author, image_url: image_url, description: description, isbn: isbn, is_checked_out: false)
    end

  end
end