class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck

  def shuffle_cards
    self.deck.cards.shuffle
  end

  def card_solved?(card)
    # card.guesses.any? {|guess| p guess.solved == true}
    card.guesses.any? {|guess| guess["solved"] == true}
    # card.guesses.each {|guess| p guess.solved}
    # guess["solved"]

    # game = Game.find(5)
    # card = Card.find(2)
    # game.card_solved?(card)

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
