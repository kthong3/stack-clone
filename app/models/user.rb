class User < ActiveRecord::Base
  include BCrypt

  has_many :votes, foreign_key: :poster_id
  has_many :questions, foreign_key: :poster_id
  has_many :answers, foreign_key: :poster_id
  has_many :comments, foreign_key: :poster_id

  validates :username, :first_name, :last_name, :email, presence: true
  validates :username, :email, uniqueness: true

  validate :validate_password

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(plain_text_password)
    @raw_password = plain_text_password
    @password = Password.create(plain_text_password)
    self.hashed_password = @password
  end

  def authenticate(plain_text_password)
    self.password == plain_text_password
  end

  def validate_password
    if @raw_password.nil?
      errors.add(:password, "is required")
    elsif @raw_password.length < 6
      errors.add(:password, "must be 6 characters or more")
    end
  end
end
