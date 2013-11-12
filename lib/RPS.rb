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
    
    puts "#{winner_count_player}"
    puts "#{winner_count_computer}"
    winners
  end

  helpers do

	def winner_count_computer
	  Score.count(:winner.like => "Computer").to_s
	end

	def winner_count_player
	  Score.count(:winner.like => "Player").to_s
	end

	def winners
		"Computer has won #{winner_count_computer} 
		and Player has won #{winner_count_player}"
    end
  
  end

  run! if app_file == $0
end












