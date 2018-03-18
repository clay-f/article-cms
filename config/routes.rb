Rails.application.routes.draw do
  root 'articles#index'

  devise_for :users

  resources :user do
    resources :messages, except: [:edit, :update]
  end

  resources :articles do
    collection do
      get "search"
    end
    resources :comments, except: [:index, :new]
  end
end
