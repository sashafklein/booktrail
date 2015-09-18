Rails.application.routes.draw do
  devise_for :users
  root to: 'landing#index'

  resources :users do 
    resources :books, only: :index
  end

  resources :books, except: :index

end
