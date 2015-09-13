get '/games/:id' do
# conditional
  # if
  @game = Game.find(params[:id])
  @cards = @game.deck.cards

  p "This is the game"
  logger.info @game.id
  logger.info @game

  p "This are the cards"
  logger.info @cards

  # iterate EACH/WHILE

  # @game.card_solved?()



  @cards.each do |card|

    if @game.guesses.empty?
      logger.info "THIS IS EMPTY!!!!!!!"
      guess = Guess.create(card_id: card.id, game_id: @game.id, solved: false)
    end

    # current_game_guesses = card.guesses.where(game_id: @game.id)

    # if card.guesses.where(game_id: @game.id)[-1]["solved"] == true
    # if @game.guesses[-1]

    logger.info "@game.guesses.where(card_id: card.id) -> #{@game.guesses.where(card_id: card.id)}"
    logger.info "@game.guesses -> #{@game.guesses}"
    logger.info "card.id -> #{card.id}"
    logger.info "@game.guesses.where(card_id: card.id).pluck(:solved) -> #{@game.guesses.where(card_id: card.id).pluck(:solved)}"

    # logger.info "@game.guesses.to_a -> #{@game.guesses.to_a}"


    # logger.info "game_guesses.pluck(:solved)-> #{game_guesses.pluck(:solved)}"

    # if @game.guesses.where(card_id: card.id)[-1]["solved"] == true
    if @game.guesses.where(card_id: card.id).pluck(:solved).include?(true)

      # logger.info


    # if card.guesses[-1]["solved"] == true
    # irb(main):019:0> cards[0].guesses.where(game_id: 39)
      next
    else
      @current_card = card
      logger.info card
      break
      # show the card page
      # erb :"cards/show"
    end

    # erb :"cards/show"
  end

  logger.info "YOU JUST BEAT THE GAMEEEEEEE"

  # game end page
  erb :"cards/show"

end

# maybe not restful, but ok for now
post '/games/:id' do

  @game = Game.find(params[:id])
  @card = @game.deck.cards.find(params[:card_id])

  if @card.answer == params[:user_guess]
    logger.info "INSIDE THE IF"
    guess = Guess.create(card_id: params[:card_id], game_id: params[:id], solved: true)
    logger.info "-------------------------------------TRUE UPDATE"
    logger.info guess

  else
    guess = Guess.create(card_id: params[:card_id], game_id: params[:id], solved: false)
    logger.info guess
    logger.info "-------------------------------------FALSE UPDATE"
  end
  # raise params.inspect
  logger.info "WE ARE Redirecting now"
  redirect :"/games/#{@game.id}"

end

