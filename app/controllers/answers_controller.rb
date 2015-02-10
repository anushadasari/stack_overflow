class AnswersController < ApplicationController

def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    @answer.save
    redirect_to root_url
    #redirect_to answers_path(@question)
  end
 
  private
    def answer_params
      params.require(:answer).permit(:body)
    end
    
def index
  @answers = Answer.all
end


def vote
 @answer = Answer.where(:id => params["question_id"].to_i).first
    
    if @answer.votes.where(:user => current_user).count > 0
      flash[:notice] = "You have already voted!"
    else
      Vote.create(voteable: @answer, user: current_user, vote: params[:vote])
    end
    respond_to do |format|
      format.html do
         flash[:notice] = "You voted."
         redirect_to :back
       end
       format.js
  end
end
end



