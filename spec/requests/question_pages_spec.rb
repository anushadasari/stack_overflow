require 'rails_helper'

RSpec.describe "QuestionPages", type: :request do
  subject { page }

  let(:user) { FactoryGirl.create(:user)}
  before { visit login_path
  fill_in "Email",  with: user.email 
  fill_in "Password", with: user.password 
  click_button "Log in" } 

  describe "question creation" do
  	before { visit user_path(user) }

  	describe "with invalid info" do

  		it "should not create a question" do
  			expect {click_button "Post"}.to_not change(Question, :count)
  		end

  		describe "error messages" do
  			before { click_button "Post"}
  			it { should have_content('error')}
  		end
  	end

  	describe "with valid info" do

  		before { fill_in 'question_content', with: "What is TDD?"}
  		it "should create a question" do
  			expect { click_button "Post" }.to change(Question, :count).by(1)
  		end
  	end
  end
  describe "question destruction" do
    before { FactoryGirl.create(:question, user: user)}

    describe "as correct user on user profile page" do
      before { visit user_path(user) }

      it "should delete a question" do
        expect{ click_link "delete" }.to change(Question, :count).by(-1)
      end
    end

    describe "as correct user on home page" do
      before { visit root_path }

      it "should delete a question" do
        expect{ click_link "delete" }.to change(Question, :count).by(-1)
      end
    end 
  end
end


