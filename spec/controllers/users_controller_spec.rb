require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	

	describe "GET#index" do
		#it "has a 200 status code" do
		#	user = FactoryGirl.create(:user)
		#	visit login_path
  		#	fill_in "Email",  with: user.email 
  			#fill_in "Password", with: user.password 
  			#click_button "Log in"
		#	get :index
			#expect(response.status).to eq(200)
			#assigns(:users).should eq([user])
		#end

		#it "renders the :index view" do
			#get :index
			#response.should render_template :index
		#end
	end

	describe "GET#show" do
		#it "assigns the requested user to @user" do
			#user = FactoryGirl.create(:user)
			#get :show, id: user
			#assigns(:user).shoul eq(user)
		#end
		#it "renders the :show template" do
		#	get :show, id: FactoryGirl.create(:user)
		#	response.should render_template :show
		#end
	end
end
