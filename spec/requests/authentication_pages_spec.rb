require 'rails_helper'

RSpec.describe "AuthenticationPages", type: :request do
  
  subject { page }

  describe "login page" do
  	before { visit login_path }

  	it { should have_selector('h1', text: 'Log in') }
  end
  
  describe "login" do
  	before { visit login_path }

  	describe "with invalid info" do
  		before { click_button "Log in" }

  		it { should have_selector('div.alert.alert-error', text: 'Invalid')}
  	end

    describe "with valid info" do
  	  let(:user) { FactoryGirl.create(:user)}
  	  before do
  	  	fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Log in"
      end

  
  	  it { should have_link('Profile', href: user_path(user))}
  	  it { should have_link('Log out', href: logout_path)}
  	  it { should_not have_link('Log in', href: login_path)}
  	  it { should have_link('Settings', href: edit_user_path(user))}

  	  describe "followed by logout" do
  		  before { click_link "Log out" }
  		  it { should have_link('Log in')}
  	  end
    end
  end

  describe "authorization" do
    describe "for non signed in users" do
      let(:user) { FactoryGirl.create(:user)}

      describe "in the Questions controller" do
         describe "submitting to the create action " do
          before { post questions_path }
          specify { response.should redirect_to(login_path)}
        end

         describe "submitting to the destroy action" do
          before do
            question = FactoryGirl.create(:question)
            delete question_path(question)
          end
          specify { response.should redirect_to(login_path)}
        end
      end
    end
  end

end

