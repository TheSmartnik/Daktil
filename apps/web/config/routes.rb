post '/verses', to: 'verses#create'
patch '/verses', to: 'verses#update'
delete '/verses', to: 'verses#destroy'
get '/verses/new', to: 'verses#new'
get '/verses/edit/:id', to: 'verses#edit'
get '/verses/', to: 'verses#index'
get '/', to: 'home#index'
# Configure your routes here
# See: http://www.rubydoc.info/gems/lotus-router/#Usage
