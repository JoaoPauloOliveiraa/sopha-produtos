Rails.application.routes.draw do
  resources :administrators
  resources :products
  get '/', to: 'login#index'
  post '/login', to: 'login#logging'
  post '/logout', to: 'logout#logout'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
