require 'sinatra/base'
require './lib/game'
require './lib/computer'
require './lib/player'

class RpsChallenge < Sinatra::Base

  enable :sessions

  $game = Game.new

  get '/' do
    erb :index
  end

  post '/' do

    $game.add_player(Player.new(session[:session_id], params[:name]))
    p $game
    redirect '/new_game'
  end

  get '/new_game' do
    (@name = $game.player1.name) if ($game.player1.id == session[:session_id])
    (@name = $game.player2.name) if ($game.player2 && $game.player2.id == session[:session_id])
    p $game
    erb :new_game
  end

  post '/result' do
    ($game.player1.choice = params[:rps]) if ($game.player1.id == session[:session_id])
    ($game.player2.choice = params[:rps]) if ($game.player2 && $game.player2.id == session[:session_id])
    redirect '/result'
  end

  get '/result' do
    @player1 = $game.player1.name
    @player2 = $game.player2.name
    @player1_choice = $game.player1.choice
    @player2_choice = $game.player2.choice
    @winner = $game.winner
    @score = $game.score
    erb :result
  end

  post '/clear_all' do
    $game.player1.choice = nil
    $game.player2.choice = nil
    redirect '/new_game'
  end

  get '/exit' do
    'Bye-bye'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
