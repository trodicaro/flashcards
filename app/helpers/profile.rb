def count_cards_in_deck(deck_id)
  Card.where(deck_id: deck_id).count
end

def count_all_guesses(deck_id)
  counter = 0
  Card.where(deck_id: deck_id).each do |card|
    Guess.where(card_id: card.id).each do |guess|
      counter += guess.attempts
    end
  end
  counter
end

def count_all_first_guesses(deck_id)
  counter = 0
  Card.where(deck_id: deck_id).each do |card|
    Guess.where(card_id: card.id).each do |guess|
      counter += guess.attempts if guess.attempts == 1
    end
  end
  counter
end

def deck_name(deck_id)
  Deck.find_by(id: deck_id).name
end
