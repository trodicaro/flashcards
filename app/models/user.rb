class User < ActiveRecord::Base
  has_many :games
  has_many :guesses
  has_many :decks, through: :games

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def authenticate(password)
    self.password == password
  end
end
