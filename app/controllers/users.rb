get '/users/new' do

  erb :"/users/new"
end

post '/users' do
  user = User.create(params[:user])

  erb :"/sessions/login"
end

get '/users/:id' do
  if session[:user_id] == nil || session[:user_id] != params[:id].to_i
    redirect "/login"
  else
    @user = User.find_by(id: params[:id])
    @games = Game.where(user_id: params[:id]).order(:created_at)
    @decks = Deck.all

    erb :'users/show'
  end
end

put '/users/:id' do
  user = User.find_by(id: params[:id])

  if user.update_attributes(params[:user])
    redirect :"users/#{user.id}"
  end

end
