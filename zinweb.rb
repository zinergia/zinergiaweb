# zinweb.rb
require 'erb'

set :views, File.dirname(__FILE__) + '/views'

get "/" do
  erb :index
end
get "/twitter" do
  erb :twitter
end
TEAM = ['sebastian', 'sergio', 'alejandro', 'juan', 'felipe', 'nicolas']
get "/team/:name" do
  name = params[:name]
  if TEAM.include? name
    erb "team/#{name}".to_sym
  else
    halt 404
  end
end
