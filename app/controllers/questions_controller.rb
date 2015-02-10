class QuestionsController < ApplicationController

	before_action :logged_in_user, only: [ :create, :destroy ]
  before_action :correct_user,   only: :destroy

  def index
   @questions = Question.all # set this as your home page
  end


  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      flash[:success] = "question created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @question.destroy
    flash[:success] = "Question deleted"
    redirect_to request.referrer || root_url
  end

  def show
      #binding.pry
    # @user = User.find(params[:user_id])
    @question = Question.find(params[:id])
end

def vote
    p "======================= #{params.inspect}"
    @question = Question.where(:id => params["id"].to_i).first
    if @question.votes.where(:user => current_user).count > 0
      flash[:notice] = "You have already voted!"
    else
      Vote.create(voteable: @question, user: current_user, vote: params["vote"] == "true")
    end

    respond_to do |format|
     format.html do
         flash[:notice] = "You voted."
         redirect_to :back
       end
       format.js
  end
end
  
# Expects 
# params[:question_id]
# params[:action] => Integer -> 1 / 0

def uvote
  question = Question.find(params[:question_id])
  if params[:action].to_i == 1
    question.upvote += 1
  else
    question.downvote += 1
  end
  question.save!

  render :json => {:success => 1}
end

# Expects params[:question_id]
def downvote
  question = Question.find(params[:question_id])
  question.downvote += 1
  question.save!

  render :json => {:success => 1}
end



private

def question_params
  params.require(:question).permit(:content)
end

def correct_user
  @question = current_user.questions.find_by(id: params[:id])
  redirect_to root_url if @question.nil?
end

end
