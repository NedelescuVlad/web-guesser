require 'sinatra'
require 'sinatra/reloader'

set :port, 3000

$secret_number = rand(100)
$guesses = 4

COLOR = {:OFFSET_HIGH => 25}

get '/' do 
	erb :index, :locals => {:rand_num => $secret_number, :message => check_guess, :color => get_color}
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
	
	if guess != nil && can_guess?

		$guesses -= 1
		if guess > $secret_number 
			message = "Guess too high!"
		elsif guess < $secret_number
			message = "Guess too low!"
		else
			message = "You guessed right! The number is #{$secret_number}"
			message << "<br>A new secret number has been generated. Please guess again!"

			reset_secret_number
		end
	elsif $guesses == 0
		# No guesses left
		message = "You are out of guesses! The number has been reset."

		reset_secret_number
	end

	if params[:cheat] == 'true'
		message << "<br>The number is #{$secret_number}"
	end

	return message
end

def reset_secret_number
	$secret_number = rand(100)
	$guesses = 4
end

def can_guess?
	return $guesses > 0
end

def get_color	
	guess = get_guess
	color = "white"

	if guess != nil
		if guess > $secret_number + COLOR[:OFFSET_HIGH]
			color = "rgb(100, 0, 0)"
		elsif guess > $secret_number
			color = "rgb(255, 0, 0)"
		elsif guess < $secret_number - COLOR[:OFFSET_HIGH]
			color = "rgb(0, 100, 0)"
		elsif guess < $secret_number 
			color = "green"
		end
	end

	return color

	
end
