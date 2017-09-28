class User < ActiveRecord::Base
  has_many :votes, foreign_key: :poster_id
  has_many :questions, foreign_key: :poster_id
  has_many :answers, foreign_key: :poster_id
  has_many :comments, foreign_key: :poster_id
end
gut
