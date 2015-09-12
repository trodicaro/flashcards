deck1 = Deck.create(name: "Portuguese")

Card.create(question: "Good morning", answer: "Bom dia", deck_id: deck1.id)
Card.create(question: "How are you", answer: "Como vai", deck_id: deck1.id)
Card.create(question: "Nice to meet you", answer: "Muito prazer", deck_id: deck1.id)
Card.create(question: "Thank you", answer: "Obrigado/obrigada", deck_id: deck1.id)
Card.create(question: "You're welcome", answer: "De nada", deck_id: deck1.id)
Card.create(question: "See you later", answer: "Ate mais tarde", deck_id: deck1.id)

deck2 = Deck.create(name: "Survival guide at DBC")

Card.create(question: "Where's the closest Subway restaurant", answer: "On Orleans street", deck_id: deck2.id)
Card.create(question: "What't the closest L station", answer: "Merchandise Mart", deck_id: deck2.id)





