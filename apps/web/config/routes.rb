post '/verses', to: 'verses#create'
get '/verses/new', to: 'verses#new'
get '/verses/', to: 'verses#index'
get '/', to: 'home#index'
# Configure your routes here
# See: http://www.rubydoc.info/gems/lotus-router/#Usage
