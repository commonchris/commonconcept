# view a dingus



get '/dingus/new' do
  erb :new
end

post '/dingus/create' do
  # slug = params[:name].downcase.gsub(' ', '-')
  dingus = Dingus.new(
      :slug => "#{params[:name].downcase.gsub(' ', '-')}", 
      :name => "#{params[:name]}"
  )
  
  if dingus.save
    status 201
    redirect '/dingus/' + dingus.id.to_s
  else 
    status 412
    redirect '/dinguses'
  end
  
end

# id
#get %r{/dingus/([0-9]+)} do
get '/dingus/:id' do 
  @dingus = Dingus.get(params[:id])
  erb :dingus
end

get '/dingus/:id/edit' do
  @dingus = Dingus.get(params[:id])
  erb :edit  
end

put '/dingus/:id' do
  dingus = Dingus.get(params[:id])
  dingus.name = (params[:name])
  dingus.slug = (params[:slug].downcase.gsub(' ', '-'))
  
  if dingus.save
    status 201
    redirect '/dingus/' + dingus.id.to_s
  else 
    status 412
    redirect '/dinguses'
  end
end

get '/dingus/:id/delete' do
  @dingus = Dingus.get(params[:id])
  erb :delete
end

delete '/dingus/:id' do
  Dingus.get(params[:id]).destroy
  redirect '/dinguses'
end

#get '/dingus/:slug' do
#  @dingus = Dingus.find('slug' => params[:slug])
#end

get '/dinguses' do
  @dinguses = Dingus.all
  erb :index
end

