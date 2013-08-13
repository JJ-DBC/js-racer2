
get '/' do
  # Look in app/views/index.erb
  @top_times = Game.order("duration ASC").limit(10)
  erb :index
end

post '/results' do
  @winner = params[:winner]
  @player = Player.find(session[@winner])
  @time   = params[:time]
  @game = Game.find(session[:game])
  @game.update_attributes(duration:@time,winner:@player.name)
  erb :win
end

post '/race' do
  session.clear
  @player1 = Player.find_or_create_by_name(params[:player1])
  @player2 = Player.find_or_create_by_name(params[:player2])
  session[:player1] = @player1.id
  session[:player2] = @player2.id
  @game = Game.create
  session[:game] = @game.id
  @game.players << @player1 << @player2
  erb :race
end
