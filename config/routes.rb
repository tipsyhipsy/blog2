Rails.application.routes.draw do
  get 'blogs/index'
  resources:blogs
end
