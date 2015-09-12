class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck

  def shuffle_cards
    self.deck.cards.shuffle
  end

  def card_solved?(card)
    card.guesses.any? {|guess| guess.solved == true}
  end

  def deck_solved?
    self.deck.cards.all? {|card| card_solved?(card) == true}
  end

  def play
    # game.deck.cards.find(2).guesses
    self.shuffle_cards




    # p shuffled_deck
  end


end
