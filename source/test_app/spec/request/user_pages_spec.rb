require 'spec_helper'

describe "User pages" do 

  subject { page }

  before do
    # @user1 =User.create!(username: "johny",
    #  email: "johny@gmail.com",
    #  about: "Let others speak for me.",
    #  first_name: "John", 
    #  last_name: "Markovich")
    # @user2 = User.create!( username: "ben",
    #  email: "ben@gmail.com",
    #  about: "Ooh, I don't know what to say.",
    #  first_name: "Ben", 
    #  last_name: "Smith")
    # @user3 = User.create!(username: "george",
    #  email: "george@gmail.com",
    #  about: "I am amazing",
    #  first_name: "George", 
    #  last_name: "Adams")

    @user1 = FactoryGirl.create(:user)

    3.times do |n|
      # Story.create!(user: @user1, active: true, url: "https://trello.com", title: "Sample story user 1",
      #   description: "some description") 
        FactoryGirl.create(:story, user_id:1)
    end

    2.times do |n|
      # Story.create!(user: @user2, active: true, url: "https://www.google.me", title: "Sample story 2",
      #   description: "some description 2") 
        FactoryGirl.create(:story, user_id:2)
    end

    2.times do |n|
      # Story.create!(user: @user3, active: true, url: "https://www.google.me", title: "Sample story story",
      #   description: "some description 3") 
        FactoryGirl.create(:story, user_id:3)
    end

    # @in1 = Story.create!(user: @user1, active: false, url: "https://trello.com", title: "Sample story",
    #   description: "some description")
    2.times do
      @in1 = FactoryGirl.create(:story, user_id:1, active:false)
    end

    2.times do |n|
      # Story.create!(user: @user2, active: false, url: "https://www.google.me", title: "Sample story 2",
      #   description: "some description 2") 
        FactoryGirl.create(:story, user_id:2, active:false)
    end

    3.times do |n|
      # Story.create!(user: @user3, active: false, url: "https://www.google.me", title: "Sample story 2",
      #   description: "some description 2") 
        FactoryGirl.create(:story, user_id:3, active:false)
    end


    3.times do |n|
        FactoryGirl.create(:comment, story_id:1, user_id:1)
     ## Comment.create!(story_id: 1, user: @user1, comment: "amazing story")
      #Comment.create!(story_id: 2, user_id: rand(3)+1, comment: "amazing story 2")
      #Comment.create!(story_id: 2, user_id: rand(3)+1, comment: "story 2 ")
    end

    visit user_path(@user1)
  end

  it {should have_selector('h1', text:'Active stories')}
  it {should have_selector('h1', text:'Inactive stories')}
  it {should have_selector('h1', text:'Commented stories')}

  describe "correct number of stories" do
    it {page.all("div.active li").count.should eql(9)}
    it {page.all("div.innactive li").count.should eql(8)}
    it {page.all("div.commented li").count.should eql(9)}
  end

  describe "story activation" do

    before do
      @innactive = Story.where(active: false)
      @active = Story.where(active: true)
      check("mycheckbox-#{@innactive.first.id}")
    end

    it "should decrease number of innactive stories" do
      expect { click_button "Activate story #{@innactive.first.id}" }.to change(@innactive, :count).by(-1)
    end

    it "should increase number of active stories" do
      expect { click_button "Activate story #{@innactive.first.id}" }.to change(@active, :count).by(1)
    end
  end
end
