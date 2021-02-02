Rails.application.routes.draw do
  
  get 'home', to: 'pages#home'
  get 'profile/:id', to: 'pages#profile', as: 'profile'
  get 'message', to: 'pages#message'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  devise_scope :user do
    root to: 'devise/sessions#new'
    get 'sign_in', to: 'devise/sessions#new'
    get 'sign_up', to: 'devise/registrations#new'
  end

  resources :users, path: '/', param: :username, only: [:show] do
    post :follow, to: 'users/follows#create', as: :follow
    delete :follow, to: 'users/follows#delete', as: :unfollow
  end

  resources :users do
    resources :posts, except: [:index]
  end

end
