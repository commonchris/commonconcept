# view a dingus

get '/dingus/:id' do
  @dingus = Dingus.get(params[:id])
  erb :dingus
end

