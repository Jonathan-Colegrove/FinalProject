Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'

  get '/reading' => 'readings#reading'
  get '/resources' => 'home#resources'
  get '/stroke_order' => 'home#stroke_order'

  get '/terms' => 'terms#index'
  get '/matching_game' => 'games#matching_game'

  resources :terms
  resources :lists
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
