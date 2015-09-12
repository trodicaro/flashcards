get '/decks' do
  @decks = Deck.all
  erb :"decks/index"
end

get '/decks/:id' do



  @deck = Deck.find(params[:id])
  # @shuffled_cards = @deck.cards.shuffle

  @game = Game.new

  @game.play(@deck)


  erb :"decks/show"
end
