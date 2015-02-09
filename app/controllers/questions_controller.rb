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
    @question.up_votes.build
    @up_vote = UpVote.new
#question = Question.find(params[:id])
    #@answers = @question.answers.all
   #@answer = @question.answers.build
   #if logged_in?
    #    @answer = current_user.answers.build
     # end
  end

def upvote
  @question = Question.find(params[:id])
  UpVote.create!(ip: request.remote_ip, voteable_id: params[:id], voteable_type: 'Question')
  #@answer = @question.answer.find(params[:question_id])
  #@question.upvote_by current_user
  #render :inline => "OK"

  redirect_to @question

end

def downvote
  @question = Question.find(params[:id])
  #@answer = @question.answer.find(params[:question_id])
  @question.downvote_by current_user
  redirect_to root_path
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
