Rails.application.routes.draw do
  resources :items
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :games do
    resources :lists do
      get '/list_items/:id/complete_list_item', to: 'list_items#complete_list_item', as: 'complete_list_item'
      resources :list_items, only: [:new, :create]
    end
  end

  get '/users/:user_id/games', to: 'games#my_games', as: 'user_games'

  get '/add-game', to: 'user_games#add_game', as: 'add_game'
  root to: 'static#home'
end
