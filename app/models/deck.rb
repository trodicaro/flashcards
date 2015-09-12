class Deck < ActiveRecord::Base
  has_many :cards
  # has_many :games
  # belongs_to :game

end
