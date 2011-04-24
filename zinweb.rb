# zinweb.rb
require 'erb'
require 'mail'
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

get '/thanks' do
  erb :thanks
end

post '/inq' do
  name = params[:name]
  mail = params[:mail]
  body = params[:body]
  
  
  smtp_settings = {
    :address        => "smtp.sendgrid.net",
    :port           => "25",
    :authentication => :plain,
    :user_name      => ENV['SENDGRID_USERNAME'],
    :password       => ENV['SENDGRID_PASSWORD'],
    :domain         => ENV['SENDGRID_DOMAIN']
  }
  
  Pony.mail(
      :to => 'hello@zinergia.co',
      :from => "#{name} <#{mail}>",
      :subject => "#{name} says Hi!",
      :body => "#{body}",
      :via => :smtp, :via_options => smtp_settings
    )
  puts "#{name} from #{mail} said #{body}"
  redirect '/thanks', 302
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
