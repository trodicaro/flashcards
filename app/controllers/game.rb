get '/games/:id' do

  @game = Game.find(params[:id])

  @cards = @game.deck.cards

  @cards.each do |card|

    if @game.guesses.where(card_id: card.id).pluck(:solved).include?(true)
      next
    else
      @current_card = card
      logger.info card
      return erb :"cards/show"
    end
    logger.info "WE ARE ABOVE GAMEWON"
  end

  logger.info "YOU JUST BEAT THE GAMEEEEEEE"

  return redirect :"decks"

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
  logger.info "WE ARE Redirecting now"
  redirect :"/games/#{@game.id}"

end

