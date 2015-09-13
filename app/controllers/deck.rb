get '/decks' do
  @decks = Deck.all
  erb :"decks/index"
end

# Game logic
get '/decks/:id' do

  # Must change user Id
  @game = Game.create(user_id: 1, deck_id: params[:id])

  redirect :"/games/#{@game.id}"

  # @deck = Deck.find(params[:id])
  # @shuffled_cards = @deck.cards.shuffle

  # @game = Game.new

  # @game.play(@deck)


  # erb :"decks/show"
end
