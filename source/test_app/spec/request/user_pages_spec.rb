require 'spec_helper'

describe "User pages" do 

  subject { page }

  before do

    @user = FactoryGirl.create(:user)

    FactoryGirl.create_list(:story, 3, user: @user)
    FactoryGirl.create_list(:innactive_stories, 2, user: @user)
    FactoryGirl.create_list(:comment, 3, user: @user)

    visit user_path(@user)
  end

  describe "should have 3 lists" do
    it {should have_selector('h1', text:'Active stories')}
    it {should have_selector('h1', text:'Inactive stories')}
    it {should have_selector('h1', text:'Commented stories')}
  end

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
