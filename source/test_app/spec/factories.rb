  FactoryGirl.define do
  	factory :user do
	  sequence(:username) { |n| "johny #{n}" }
	  sequence(:email) { |n| "johny_#{n}@gmail.com" }
	  about "Let others speak for me."
	  first_name "John"
	  last_name "Markovich"

	  factory :user_with_stories do

	    ignore do
	      story_count 5
   	    end

  	    after(:create) do |user, evaluator|
  	      create_list(:story, evaluator.story_count, user: user )
	    end
	  end
    end

    factory :story do
      user
      active true
      url "https://www.google.me"
      title "Titl"
      description "Some description"

      factory :innactive_stories do
      	active false
      end

      factory :stories_with_comments do

        ignore do
          comment_count 5
        end

        after(:create) do |story, evaluator|
          create_list(:comment, evaluator.comment_count, story: story)
        end
      end
    end

    factory :comment do
    	story
    	user
    	comment "This is an amazing story!"
    end
  end