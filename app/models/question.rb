class Question < ActiveRecord::Base
  belongs_to :poster, class_name: "User"
  has_many :answers
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

  def up_vote(user_id)
    vote_search = self.votes.find_by poster_id: user_id
    if vote_search
      if vote_search.up_down_vote != 1
        vote_search.up_down_vote = 1
        vote_search.save
      end
    else
      self.votes << Vote.create(up_down_vote: 1, poster_id: user_id)
    end
  end

  def down_vote(user_id)
    vote_search = self.votes.find_by poster_id: user_id
    if vote_search
      if vote_search.up_down_vote != -1
        vote_search.up_down_vote = -1
        vote_search.save
      end
    else
      self.votes << Vote.create(up_down_vote: -1, poster_id: user_id)
    end
  end

end
