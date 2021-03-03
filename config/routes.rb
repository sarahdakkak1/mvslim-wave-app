Rails.application.routes.draw do
  devise_for :users
  get 'page/index'
  get '/businesses/search', to: 'businesses#search', as: :search

  root to: 'page#index'
    resources :restaurants do
        resources :recommendations, only: [:new, :create]
    end
    resources :shops do
    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
