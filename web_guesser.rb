require 'sinatra'
require 'sinatra/reloader'


x=1
y=2

while x!= y do
x = rand(101)
y = rand(101)
end

get '/' do
    "hello, World!"
    "THE SECRET NUMBER IS #{x} where #{y} is the secret number"
end