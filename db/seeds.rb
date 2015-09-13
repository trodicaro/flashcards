deck1 = Deck.create(name: "Portuguese")

card1 = Card.create(question: "Good morning", answer: "Bom dia", deck_id: deck1.id)
card2 = Card.create(question: "How are you", answer: "Como vai", deck_id: deck1.id)
card3 = Card.create(question: "Nice to meet you", answer: "Muito prazer", deck_id: deck1.id)
card4 = Card.create(question: "Thank you", answer: "Obrigado/obrigada", deck_id: deck1.id)
card5 = Card.create(question: "You're welcome", answer: "De nada", deck_id: deck1.id)
card6 = Card.create(question: "See you later", answer: "Ate mais tarde", deck_id: deck1.id)

deck2 = Deck.create(name: "Survival guide at DBC")

card7 = Card.create(question: "Where's the closest Subway restaurant", answer: "On Orleans street", deck_id: deck2.id)
card8 = Card.create(question: "What't the closest L station", answer: "Merchandise Mart", deck_id: deck2.id)

#cards in "Portuguese" deck
# Guess.create(user_id: 1, card_id: card1.id, solved: false)
# Guess.create(user_id: 1, card_id: card1.id, solved: false)

#cards in "Survival guide at DBC" deck
# Guess.create(game_id: 1, card_id: card7.id, solved: false)
# Guess.create(game_id: 1, card_id: card7.id, solved: true)
# Guess.create(game_id: 1, card_id: card8.id, solved: false)
# Guess.create(game_id: 1, card_id: card8.id, solved: true)

Game.create(user_id: 1, deck_id: deck2.id)

# Another one - test if the guesses bleed out
Game.create(user_id: 1, deck_id: deck2.id)
# Guess.create(game_id: 1, card_id: card7.id, solved: false)
# Guess.create(game_id: 1, card_id: card8.id, solved: false)



# the one that should fail
deck3 = Deck.create(name: "Pets")
card9 = Card.create(question: "Dog", answer: "Kasey", deck_id: deck3.id)
card10 = Card.create(question: "Cat", answer: "Butler", deck_id: deck3.id)
# Guess.create(game_id: 1, card_id: card9.id, solved: false)
# Guess.create(game_id: 1, card_id: card10.id, solved: false)
Game.create(user_id: 1, deck_id: deck3.id)
