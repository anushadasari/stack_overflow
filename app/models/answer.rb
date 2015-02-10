class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :votes, as: :voteable

def total_vote
	self.votes.where(vote:true).size - self.votes.where(vote:false).size
end
end