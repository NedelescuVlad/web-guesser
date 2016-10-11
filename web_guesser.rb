require 'sinatra'
require 'sinatra/reloader'

rand_num = -1
get '/' do 
	if rand_num == -1
		rand_num = rand(101)
	end

	"The secret number is #{rand_num}"
end
