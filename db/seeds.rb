User.create(name:"nic",email:"lombardi",password:"asdf")
Game.create(user_id: 1, deck_id: 1 )
Game.create(user_id: 1, deck_id: 2 )
Deck.create(name:"first_deck")
Deck.create(name:"second_deck")
Card.create(deck_id:1,question:"question1",answer:"answer1")
Card.create(deck_id:1,question:"question2",answer:"answer2")
Guess.create()
