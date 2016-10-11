require 'sinatra'
require 'sinatra/reloader'

rand_num = -1
get '/' do 
	if rand_num == -1
		rand_num = rand(101)
	end

	erb :index, :locals => {:rand_num => rand_num}

end

