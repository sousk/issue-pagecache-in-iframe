require 'sinatra'

get '/iframe' do
  erb :iframe
end

get '/iframe-b' do
  erb :iframeb
end

get '/a' do
  erb :a
end

get '/b' do
  response.headers['Cache-Control'] = 'no-store';
  erb :b, :locals => {:t => Time.now.strftime("%H:%M:%S") }
end

get '/c' do
  erb :c
end
