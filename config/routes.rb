Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'

  get '/resources' => 'home#resources'

  resources :terms
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
