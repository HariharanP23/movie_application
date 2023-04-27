Rails.application.routes.draw do



  get 'users/show'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
  registrations: 'users/registrations'
  }
  resources :movies do
    resources :ratings, only: :create
    resources :comments,only: :create
      end

  root 'movies#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
