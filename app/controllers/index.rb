get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/win/:player' do
  @player = params[:player]
  erb :win
end
