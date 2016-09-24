Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'

  get '/resources' => 'home#resources'
  get '/stroke_order' => 'home#stroke_order'

  get '/terms' => 'terms#index'

  resources :terms
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
