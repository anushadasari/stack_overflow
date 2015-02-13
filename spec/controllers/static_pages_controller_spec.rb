require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  subject { page }

  describe " Home page " do
  before { visit root_path }
	 it { should have_selector('h1', text: 'StackOverflow') }
	end
end


