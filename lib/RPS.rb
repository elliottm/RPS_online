require 'data_mapper'
require 'sinatra/base'


env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/rps_#{env}")

require './lib/RPS'
require './lib/score'

DataMapper.finalize

DataMapper.auto_upgrade!

class RPS < Sinatra::Base

set :views, File.join(File.dirname(__FILE__), '..', 'views')

  get '/' do
    erb :index
  end

  post '/score' do
    #why if change :winner works?
    winner = params[:winner]
    # puts "#{winner}"

    Score.create(:winner => winner) 
  end

  get '/score' do
  	Score.last.winner
  	puts "#{Score.last.winner}"
  	Score.last.winner
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end


