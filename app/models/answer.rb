class Answer < ActiveRecord::Base
  belongs_to :poster, class_name: "User"
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  def positive_vote_count
    positive_votes = self.votes.select { |vote| vote.up_down_vote > 0 }
    positive_votes.count
  end

  def negative_vote_count
    negative_votes = self.votes.select { |vote| vote.up_down_vote < 0 }
    negative_votes.count
  end

  def total_vote_count
    total_votes = self.votes.reduce(0) { |total, vote| total + vote.up_down_vote }
  end
end
