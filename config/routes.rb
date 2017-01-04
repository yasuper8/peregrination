Rails.application.routes.draw do
  # resources :cities do
  #     resources :posts
  # end




  get '/', to: 'users#index', as: 'users'


  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'

  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  patch '/users/:id', to: 'users#update'

  get '/posts/:id', to: 'posts#show', as: 'post'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get  '/logout', to: 'sessions#destroy'

  get '/cities/:id', to:'cities#show', as: 'city'

  get '/cities/:id/posts/new', to: 'posts#new', as: 'new_post'
  post '/cities/:id/posts', to: 'posts#create'

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
