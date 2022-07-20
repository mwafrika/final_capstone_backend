Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json },
  controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }
  get '/member-data', to: 'members#show'
  get 'latest', to: 'cars#latest'

  root "cars#index"
  resources :cars, only: [:index, :show, :create, :new, :destroy, :update]
  resources :locations, only: [:index, :show, :create, :new, :destroy, :update]
  resources :reservations, only: [:index, :show, :create, :new, :destroy, :update]
end
