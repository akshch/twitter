Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htm
  resources :users, only: [:create, :show]
  resources :sessions, only: [:create]

  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  get '/signup' => 'users#new'

  resources :tweets do
    member do
    resources :comments, only: [:create]
    end
  end
  root 'tweets#index'

end
