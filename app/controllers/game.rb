get '/games/:id' do


  @game = Game.find(params[:id])
  logger.info "THIS IS THE GAME: #{@game} #{@game.id} #{@game.deck_id}"
  logger.info "Game deck: #{@game.deck}"
  logger.info "Game cards: #{@game.deck.cards}"
  @cards = @game.deck.cards

  p "This is the game"
  logger.info @game.id
  logger.info @game

  p "This are the cards"
  logger.info @cards

  game_won = false

  @cards.each do |card|

    # This may or may not need to be here....
    # if @game.guesses.empty?
    #   logger.info "THIS IS EMPTY!!!!!!!"
    #   guess = Guess.create(card_id: card.id, game_id: @game.id, solved: false)
    # end

    if @game.guesses.where(card_id: card.id).pluck(:solved).include?(true)
      next
    else
      @current_card = card
      logger.info card
      # game_won = true
      logger.info "game_won -> #{game_won}"
      # break
      return erb :"cards/show"
    end
    # erb :"cards/show"
    logger.info "WE ARE ABOVE GAMEWON"
    # game_won = true
  end

  logger.info "YOU JUST BEAT THE GAMEEEEEEE"

  return redirect :"decks/index"
  # logger.info "game_won -> #{game_won}"
  # if game_won == true
  #   redirect :"/decks/index"
  # else
  #   erb :"cards/show"
  # end


  # erb :"cards/show"
  # redirect :"/decks/index"

  # redirect congratulations!!!!
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

