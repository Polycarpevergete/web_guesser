require 'sinatra'
require 'sinatra/reloader'

def secretNumber
    x=1
    y=2
    while x!= y do
    x = rand(101)
    y = rand(101)
    end
    secretNumber = x
end

@@x = secretNumber

def check_guess(guess)
    message ="fuck"
    if guess.to_i > @@x
        message = "too High"
        #color = 'salmon'
    end
    if guess.to_i < @@x
        message = "too low"
        #color = 'salmon'
    end
    if guess.to_i == @@x
        message = "correct!"    
        #color = 'green'
    end
    if guess.to_i > (@@x+5)
        message = "way too high"
        #color = 'red'
    end
    if guess.to_i < (@@x-5)
        message = "way too low"
        #color = 'red'
    end
    check_guess = message
end

def background_color(guess)
    color = "ntm"
    if guess.to_i > @@x
        color = 'salmon'
    end
    if guess.to_i < @@x
        color = 'salmon'
    end
    if guess.to_i == @@x
        color = 'green'
    end
    if guess.to_i > (@@x+5)
        color = 'red'
    end
    if guess.to_i < (@@x-5)
        color = 'red'
    end
    background_color = color
end

@@tries = 5

def substract(guess)
    if guess.to_i != @@x
        @@tries = @@tries - 1
        substract = @@tries
    end 
end

def winner(guess)
    message = "Bravo c'est gagné ! "
    if guess.to_i == @@x
        winner = message
    end
end

def looser(guess)
    message = "T'as perdu tête de con !"
    if @@tries == 0
        looser = message
    end
end

def reinitialize_win(guess)
    if guess.to_i == @@x
        @@tries = 5
        @@x = secretNumber
        reinitialize_win = @@tries
    end 
end

def reinitialize_loose(guess)
    if guess.to_i != @@x && @@tries == -1
        @@tries = 5
        @@x = secretNumber
        reinitialize_loose = @@tries
    end 
end

get '/' do
    message = check_guess(params["guess"])
    color = background_color(params["guess"])
    counter = substract(params["guess"])
    if counter.to_i < 0
        counter = ""
    end
    winner = winner(params["guess"])
    reinitialize_win = reinitialize_win(params["guess"])
    reinitialize_loose = reinitialize_loose(params["guess"])
    looser = looser([params["guess"]])

    #if params["guess"] == "#{params["guess"]}&cheat=true"
     #   params["guess"] = @@x
    #end

    if params["cheat"] == 'true'
       params["guess"] = @@x 
       message = "correct"
       color = "green"
       winner = "Encule de tricheur, bien ouej !"
       counter = substract(params["guess"])
        if counter.to_i < 0
            counter = ""
        end
       reinitialize_win = reinitialize_win(params["guess"])
       reinitialize_loose = reinitialize_loose(params["guess"]) 
    end

    erb :index, :locals => {:x => @@x, :message => message, :color => color, :counter => counter, :winner => winner, :reinitialize_win => reinitialize_win, :looser => looser, :reinitialize_loose => reinitialize_loose}
end


