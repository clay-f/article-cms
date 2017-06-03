Rails.application.routes.draw do

  devise_for :users

  resources :articles do
    collection do
      get "search"
    end
    resources :comments, except: [:index, :new]
  end

  root 'articles#index'
end
