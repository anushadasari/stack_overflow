class Question < ActiveRecord::Base
	belongs_to :user
	has_many :answers, dependent: :destroy
	has_many :up_votes, as: :voteable
 
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true

def scoreu
	self.get_upvotes.size
end


def scored
	self.get_downvotes.size
end


end


