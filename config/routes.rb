Rails.application.routes.draw do
  get 'maps/index'
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

  root to: 'top#index'
  get "about" => "about#index"

  scope module: :users do
  resources :users, only:[:index, :show, :edit, :update]
  end
  resources :maps, only:[:index]

  resources :posts do
    resource :favorites, only: [:create, :destroy]
  end
end
