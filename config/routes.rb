Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  
  root 'articles#index'

  devise_for :users

  resources :user do
    resources :messages, except: [:edit, :update]
  end

  resources :articles do
    collection do
      get "search"
    end
    member do
      get "profile"
    end
    resources :comments, except: [:index, :new]
  end

  resources :like_articles, only: [:create, :destroy, :index]
end
