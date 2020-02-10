Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, :shoutouts
  post '/login', to: 'sessions#create'
  get '/profile', to: 'users#profile'
end
