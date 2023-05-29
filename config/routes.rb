Rails.application.routes.draw do
  get '/new', to: 'games#new', as: 'new_game'
  post '/score', to: 'games#score', as: 'score_game'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
