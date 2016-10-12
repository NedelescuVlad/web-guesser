# Web Guesser
A simple number guessing web app. A new number is generated once 5 guesses are made or the user guesses corectly.

Feedback is provided at each guess.

There is also a cheat mode, but I'm not going to tell you how to activate it. (add '&cheat=true' to the website URL after making a guess and reload) 

# Prerequisites
* git
* ruby 

# Installation
Assuming the prerequisites are met, a simple UNIX based OS installation would be:

`gem install sinatra`
`gem install sinatra-contrib`
`git clone https://github.com/NedelescuVlad/web-guesser ~/`

In order to start the server:

`ruby ~/web_guesser/web_guesser.rb`

After which you can visit localhost:3000 on your favourite web browser to play.
