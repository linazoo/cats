get "/" do
    redirect "/cats"
end

get "/cats" do
    @cats = Cat.all
    erb :"cats/index"
end

get '/cats/new' do 
    erb :"cats/new"
end 

#show route - needs a specific cat's id
get '/cats/:id' do 
    @cat = Cat.find(params[:id])
    erb :"cats/show"
end 

post '/cats' do 
# {"name"=>"figgins", "color"=>"grey", "commit"=>"Create Cat"}
    @cat = Cat.new(params)
    if @cat.valid?
        @cat.save!
        redirect '/cats'
    else
        redirect '/cats/new'
    end
end 

get '/cats/:id/edit' do 
    @cat = Cat.find(params[:id])
    erb :"cats/edit"
end

put '/cats/:id' do 
    @cat = Cat.find(params[:id])
    @cat.update({:name => params[:name], :color => params[:color]})
    if @cat.valid?
        redirect "/cats/#{@cat.id}"
    else
        redirect "/cats/#{@cat.id}/edit"
    end
end

delete '/cats/:id' do
    Cat.find(params[:id]).destroy!
    redirect '/cats'
end