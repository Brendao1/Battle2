require 'sinatra/base'
require_relative './lib/player'

class Battle < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/names' do
    $Player1 = Player.new(params[:Player1])
    $Player2 = Player.new(params[:Player2])
    redirect '/play'
  end

  get '/play' do
    @Player1 = $Player1
    @Player2 = $Player2
    @Player2_hitpoints = 60
    erb :play

  end

get '/attack' do
    @Player1 = $Player1
    @Player2 = $Player2
    erb :attack
end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
