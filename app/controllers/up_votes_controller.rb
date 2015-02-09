class UpVotesController < ApplicationController
def create
    @question = Question.find(params[:question_id])
    @up_vote = @question.up_votes.new(up_vote_params)

    respond_to do |format|
      if @up_vote.save
      	@new_votes_count = @question.up_votes.count
      	format.html { redirect_to @up_vote, notice: 'Voted up' }
        format.json { render json: @up_vote, status: :created, location: @up_vote }
        format.js
      else
      	@new_votes_count = @question.up_votes.count
      	format.html { render action: "new" }
        format.json { render json: @up_vote.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  private

    def up_vote_params
      params.permit(:voteable_id, :voteable_type, :ip)
    end

end
