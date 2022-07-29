Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, defaults: { format: :json },
  controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }
  get '/member-data', to: 'members#show'
  get 'latest', to: 'bikes#latest'

  root "bikes#index"
  resources :bikes, only: [:index, :show, :create, :new, :destroy, :update]
  resources :locations, only: [:index, :show, :create, :new, :destroy, :update]
  resources :reservations, only: [:index, :show, :create, :new, :destroy, :update]
end
