class AnswersController < ApplicationController

def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    @answer.save
    redirect_to answers_path(@question)
  end
 
  private
    def answer_params
      params.require(:answer).permit(:body)
    end
    
def index
end

end



