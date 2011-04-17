# zinweb.rb

get '/' do
    File.read('index.html')
end