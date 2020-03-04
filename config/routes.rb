Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    collection do
      get 'confirm'
    end
  end
  resources :users do
    collection do
      get 'signout'
      get 'card'
    end
  end
end
