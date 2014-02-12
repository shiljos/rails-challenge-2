namespace :db do
  desc "Fill database with sample data"
    task populate: :environment do
      User.create!(username: "johny",
                   email: "johny@gmail.com",
                   about: "Let others speak for me.",
                   first_name: "John", 
                   last_name: "Markovich")
      User.create!( username: "ben",
                   email: "ben@gmail.com",
                   about: "Ooh, I don't know what to say.",
                   first_name: "Ben", 
                   last_name: "Smith")
      User.create!(username: "george",
                   email: "george@gmail.com",
                   about: "I am amazing",
                   first_name: "George", 
                   last_name: "Adams")
     


      3.times do |n|
        Story.create!(user_id: 1, active: true, url: "https://trello.com", title: "Sample story user 1",
                      description: "some description") 
      end

      2.times do |n|
        Story.create!(user_id: 2, active: true, url: "https://www.google.me", title: "Sample story 2",
                      description: "some description 2") 
      end

      2.times do |n|
        Story.create!(user_id: 3, active: true, url: "https://www.google.me", title: "Sample story story",
                      description: "some description 3") 
      end

       Story.create!(user_id: 1, active: false, url: "https://trello.com", title: "Sample story",
                      description: "some description")

       2.times do |n|
        Story.create!(user_id: 2, active: false, url: "https://www.google.me", title: "Sample story 2",
                      description: "some description 2") 
      end

      3.times do |n|
        Story.create!(user_id: 3, active: false, url: "https://www.google.me", title: "Sample story 2",
                      description: "some description 2") 
      end


      3.times do |n|

        Comment.create!(story_id: 1, user_id: rand(3)+1, comment: "amazing story")

        Comment.create!(story_id: 2, user_id: rand(3)+1, comment: "amazing story 2")

        Comment.create!(story_id: 2, user_id: rand(3)+1, comment: "story 2 ")
      end
  end
end