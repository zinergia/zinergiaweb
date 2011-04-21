# zinweb.rb
require 'erb'
require 'pony'

set :views, File.dirname(__FILE__) + '/views'

get "/" do
  erb :index
end
get "/twitter/?" do
  erb :twitter
end

get '/qrcard/?' do
    erb :qrcard
end

post '/contact/?' do
  name = params[:name]
  mail = params[:mail]
  body = params[:body]
  Pony.mail(:to => 'hello@zinergia.co', :from => "#{mail}", :subject => "#{name} says Hi!", :body => "#{body}")
end

TEAM = %w(sebastian sergio alejandro juan felipe nicolas)

get "/team/:name" do
  name = params[:name]
  if TEAM.include? name
    erb "team/#{name}".to_sym
  else
    halt 404
  end
end
