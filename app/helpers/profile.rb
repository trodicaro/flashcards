def count_cards_in_deck(deck_id)
  Card.where(deck_id: deck_id).count
end

def count_all_guesses(game)
  Guess.where(game_id: game).count
end

def count_all_first_guesses(game)
  counter = 0
  Guess.where(game_id:game).group(:card_id).count.each do |group|
      counter += 1 if group[1] == 1
  end
  counter
end

def deck_name(deck_id)
  Deck.find_by(id: deck_id).name
end
