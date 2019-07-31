Rails.application.routes.draw do
  resources :feeds
  get 'sessions/new'
  resources:users
  resources:sessions, only:[:new, :create, :destroy]
  resources:blogs do
    collection do
      post :confirm
    end
  end
  resources :favorites, only: [:create, :destroy]  
end
