Rails.application.routes.draw do

  get 'topics/index'
  get 'topics/show'
  devise_for :users, controllers: {
  sessions:      'devise/sessions',
  passwords:     'devise/passwords',
  registrations: 'devise/registrations'
}

  root to: 'top#index'
  get 'about' => 'about#index'
  get 'maps/index'

  resources :topics do
    resource :topic_comments, only: [:create, :destroy]
  end

  resources :users, only:[:index, :show, :edit, :update] do
    get 'topics' => 'users#topics'
    resource :relationships, only: [:create, :destroy]
    get 'follows' => 'relationships#followed', as: 'followers'
    get 'followers' => 'relationships#follower', as: 'follows'
  end

  resources :posts do
    resource :favorites, only: [:create, :destroy]
  end

  resources :messages, :only => [:create, :destroy]
  resources :rooms, :only => [:index, :show, :create, :destroy]

  resources :maps, only:[:index]
end
