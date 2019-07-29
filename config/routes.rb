Rails.application.routes.draw do
  get 'sessions/new'
  resources:blogs
  resources:users
  resources:sessions
end
