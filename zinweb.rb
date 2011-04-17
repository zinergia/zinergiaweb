# zinweb.rb

get "/" do
  File.read(File.join('public', 'index.html'))
end
