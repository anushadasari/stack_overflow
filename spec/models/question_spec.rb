require 'rails_helper'

RSpec.describe Question, type: :model do

	let(:user) { FactoryGirl.create(:user)}
	before { @question = user.questions.build(content: "what is TDD?")}

	subject { @question }

	it { should respond_to(:content)}
	it { should respond_to (:user_id)}
	it { should respond_to(:user)}
	its(:user) { should == user } 

	it { should be_valid }

	it "has a valid factory" do
		FactoryGirl.create(:question , user: user).should be_valid
	end


    describe " when user_id is not present " do
    	before { @question.user_id = nil }
    	it { should_not be_valid}
    end

    describe "with blank content" do
    	before { @question.content = " "}
    	it { should_not be_valid}
    end

  


    
end




