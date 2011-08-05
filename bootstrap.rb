require 'rubygems'
require 'sinatra'
require 'datamapper'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/text.db")

class Text
  include DataMapper::Resource
  
  property :id, Serial
  property :title, String
  property :body, Text
  property :created_at, DateTime
end

# automatically create the text table
Text.auto_migrate! unless Text.storage_exists?



get '/' do
  "Test test test test "
end

get '/texts' do
  # print a list of texts
  @texts = Text.all
  erb :"texts/index"
end

get '/text/:id' do
  @text = Text.get(params[:id])
  
  if @text
    erb :"texts/show"
  else 
    redirect '/'  
  end
end

get '/text' do
  erb :"texts/edit"
end

post '/text' do
  # create a new text

  
  @text = Text.new(
    :title => "test static",
    :body => "hard body",
    :created_at => Time.now
  )
  
  @text.save

  
  
end

put '/text/:id' do
  # update a text
end

delete '/text/:id' do
  # delete a text
end


