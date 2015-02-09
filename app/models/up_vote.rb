class UpVote < ActiveRecord::Base
	belongs_to :voteable, polymorphic: true
end
