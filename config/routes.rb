Rails.application.routes.draw do
  get 'maps/index'
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

  scope module: :users do
  resources :users, only:[:index, :show, :edit, :update]
  end
  resources :maps, only:[:index]

  resources :posts
  root to: 'top#index'
  get "about" => "about#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
