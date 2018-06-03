Rails.application.routes.draw do
  devise_for :users
  resources :users, :only => [:show, :edit, :update, :destroy]

  root to: 'pages#home'

  resources :games do
    collection do                       # collection => no restaurant id in URL
      get 'global', to: "games#global_ranking"  # RestaurantsController#top
      get 'grouperank', to: "games#my_group"  # RestaurantsController#top
    end
    resources :bets, :only => [:new, :create]
  end

  get "nogroup", to: "games#nogroup"
  resources :bets, only: [:edit, :update, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
