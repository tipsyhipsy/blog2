Rails.application.routes.draw do
  get 'sessions/new'
  resources:blogs
  resources:users
  resources:sessions, only:[:new, :create, :destroy]
end
