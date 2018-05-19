Rails.application.routes.draw do
  devise_for :users
  resources :users, :only => [:show, :edit, :update, :destroy]

  root to: 'pages#home'

  resources :games do
    resources :bets, :only => [:new, :create]
  end

  resources :bets, only: [:edit, :update, :destroy]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
