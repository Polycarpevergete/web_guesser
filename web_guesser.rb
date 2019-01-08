require 'sinatra'
require 'sinatra/reloader'


x=1
y=2

while x!= y do
x = rand(101)
y = rand(101)
end

message = "fuck"

get '/' do
    params["guess"]
    if params["guess"].to_i > x
        message = "too High"
        color = 'salmon'
    end
    if params["guess"].to_i < x
        message = "too low"
        color = 'salmon'
    end
    if params["guess"].to_i == x
        message = "correct!"    
        color = 'green'
    end
    if params["guess"].to_i > (x+5)
        message = "way too high"
        color = 'red'
    end
    if params["guess"].to_i < (x-5)
        message = "way too low"
        color = 'red'
    end
    
    erb :index, :locals => {:x => x, :message => message, :color =>color}
end


