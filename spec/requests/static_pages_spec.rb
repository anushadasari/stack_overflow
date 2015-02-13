require 'rails_helper'

RSpec.describe "StaticPages", type: :request do

	subject { page }

    describe " Home page " do
    before { visit root_path }
	  it { should have_selector('h1', text: 'StackOverflow') }

	  describe "for signed-in users " do
		let(:user) { FactoryGirl.create(:user)}
		before do
			FactoryGirl.create(:question, user: user, content: "First question?")
		    FactoryGirl.create(:question, user: user, content: "next question?")
		    visit login_path
  			fill_in "Email",  with: user.email 
  			fill_in "Password", with: user.password 
  			click_button "Log in"
  			visit root_path
  		end
  		it "Should render the user's feed" do
  			user.feed.each do |item|
  				#page.should have_selector("#{item.id}", text: item.content)
  			end
  		end
  	end
	end

	describe "Help page" do
		before { visit help_path }

		it { should have_selector('h1', text: 'Help')}
	
	end
end
