Rails.application.routes.draw do

  get 'topics/index'
  get 'topics/show'
  devise_for :users, controllers: {
  sessions:      'devise/sessions',
  passwords:     'devise/passwords',
  registrations: 'devise/registrations'
}

  root to: 'top#index'
  get "about" => "about#index"
  get 'maps/index'

  resources :topics do
    resource :topic_comments, only: [:create, :destroy]
  end

  resources :users, only:[:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'follows' => 'relationships#follower', as: 'follows'
    get 'followers' => 'relationships#followed', as: 'followers'
  end

  resources :posts do
    resource :favorites, only: [:create, :destroy]
  end

  resources :messages, :only => [:create, :destroy]
  resources :rooms, :only => [:index, :show, :create]

  resources :maps, only:[:index]
end
