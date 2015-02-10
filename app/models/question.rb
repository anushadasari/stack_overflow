class Question < ActiveRecord::Base
	belongs_to :user
	has_many :answers, dependent: :destroy
	has_many :votes, as: :voteable
 
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true



def total_vote
	self.votes.where(vote:true).size - self.votes.where(vote:false).size
end

end


