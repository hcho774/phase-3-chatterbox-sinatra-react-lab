class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  
  get '/bootcamps' do
    bootcamp = Bootcamp.all
    bootcamp.to_json
  end 

    
  get '/bootcamps/:id' do
    bootcamp = Bootcamp.find(params[:id])
    bootcamp.to_json(include: :reviews)
  end

  




  get '/messages' do
    messages = Message.all.order(created_at: :asc)
    messages.to_json
end 

  post '/messages' do
    message = Message.create(
      username: params[:username],
      body: params[:body]
    )
    message.to_json
  end

  patch '/messages/:id' do
    message = Message.find(params[:id])
    message.update(
      body: params[:body]
    )
    message.to_json
  end

  delete '/messages/:id' do
    message = Message.find(params[:id])
    message.destroy
    message.to_json

  end


end
