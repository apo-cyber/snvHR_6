Rails.application.routes.draw do

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    member do
      post :retired
    end
  end

  resources :careers

  resources :posts  do
    collection do
      get :shows
    end
  end

  root 'articles#index'
  get '/portal', to: 'articles#portal'
  resources :articles

end
