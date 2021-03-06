require 'rails_helper'

RSpec.describe "UserPages", type: :request do
  subject { page }


  describe "signup page" do
  	before { visit signup_path }

  	it { should have_selector('h1',  text: 'Sign up')}
  end

  describe "signup" do
    before { visit signup_path}
  	let(:submit) { "Create my account"}
  	
  	describe "with invalid info" do
  		it "should not create a user" do
  			expect { click_button submit }.not_to change(User, :count)
  		end

  		describe "after submission" do
  			before { click_button submit }

  			it { should have_content('error')}
  		end
  	end

  	describe "with valid info" do
  		before do
  			fill_in "Name",           with: "Test user"
  			fill_in "Email",          with: "user@example.com"
  			fill_in "Password",       with: "Password"
  			fill_in "Confirmation",   with: "Password"
  		end
  		it "should create a user" do
  			expect { click_button submit}.to change(User, :count).by(1)
  		end
  		describe "after saving the user" do
  			before { click_button submit }
  			let(:user) { User.find_by_email('user@example.com')}

  			it { should have_selector('div.alert.alert-success', text: 'Welcome')}
        it { should have_link('Log out')}
  		end
  	end
  end
end
  
  

  
