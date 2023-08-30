Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"
  get 'profile', to: 'pages#profile', as: 'profile'

  resources :musics, except: [:show]
  resources :articles do
    resources :comments, only: [:create, :destroy], shallow: true do
      resources :likes, only: [:create, :destroy]
    end
    resources :likes, only: [:create, :destroy]
  end
end
