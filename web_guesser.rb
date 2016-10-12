require 'sinatra'
require 'sinatra/reloader'

set :port, 3000

SECRET_NUMBER = rand(100)

COLOR = {:OFFSET_HIGH => 25}

get '/' do 
	erb :index, :locals => {:rand_num => SECRET_NUMBER, :message => check_guess, :color => get_color}
end

def get_guess
	guess = nil

	if params[:guess] != nil
		guess = params[:guess].to_i
	end

	return guess
end

def check_guess()
	guess = get_guess
	message = ""
	
	if guess != nil 
		if guess > SECRET_NUMBER 
			message = "Guess too high!"
		elsif guess < SECRET_NUMBER
			message = "Guess too low!"
		else
			message = "You guessed right! The number is #{SECRET_NUMBER}"
		end
	end

	return message
end

def get_color	
	guess = get_guess
	color = "white"

	if guess != nil
		if guess > SECRET_NUMBER + COLOR[:OFFSET_HIGH]
			color = "rgb(100, 0, 0)"
		elsif guess > SECRET_NUMBER
			color = "rgb(255, 0, 0)"
		elsif guess < SECRET_NUMBER - COLOR[:OFFSET_HIGH]
			color = "rgb(0, 100, 0)"
		elsif guess < SECRET_NUMBER 
			color = "green"
		end

	end

	return color

	
end
