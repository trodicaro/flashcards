def count_cards_in_deck(deck_id)
  Card.where(deck_id: deck_id).count
end

def count_all_guesses(deck_id)
  counter = 0
  all_cards = Card.where(deck_id: deck_id)
  all_cards.each do |card|
    all_guesses = Guess.where(card_id: card.id)
    all_guesses.each do |guess|
      counter += guess.attempts
    end
  end
  counter
end

def count_all_first_guesses(deck_id)
  counter = 0
  all_cards = Card.where(deck_id: deck_id)
  all_cards.each do |card|
    all_guesses = Guess.where(card_id: card.id)
    all_guesses.each do |guess|
      if guess.attempts == 1
        counter += guess.attempts
      end
    end
  end
  counter
end

def deck_name(deck_id)
  Deck.find_by(id: deck_id).name
end
