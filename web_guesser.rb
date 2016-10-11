require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)
get '/' do 
	message = check_guess
	erb :index, :locals => {:rand_num => SECRET_NUMBER, :message => message}

end

def check_guess()
	guess = params[:guess].to_i
	message = ""
	
	if params[:guess] != nil 
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
