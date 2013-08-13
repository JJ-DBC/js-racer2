
get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/results' do
  @winner = params[:winner].to_sym
  @player = Player.find(session[@winner]).name
  erb :win
end

post '/race' do
  session.clear
  @player1 = Player.find_or_create_by_name(params[:player1])
  @player2 = Player.find_or_create_by_name(params[:player2])
  session[:player1_id] = @player1.id
  session[:player2_id] = @player2.id
  @game = Game.new
  @game.players << @player1 << @player2
  erb :race
end
