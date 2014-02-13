  FactoryGirl.define do
  	factory :user do
	  sequence(:username) { |n| "johny #{n}" }
	  sequence(:email) { |n| "johny_#{n}@gmail.com" }
	  about "Let others speak for me."
	  first_name "John"
	  last_name "Markovich"
    end

    factory :story do
      user
      active true
      url "https://www.google.me"
      title "Titl"
      description "Some description"
    end

    factory :comment do
    	story
    	user
    	comment "This is an amazing story!"
    end
  end