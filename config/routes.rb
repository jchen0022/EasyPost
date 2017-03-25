Rails.application.routes.draw do
  root 'static_pages#home'

  get '/' => 'static_pages#home'
  post '/' => 'static_pages#home'
end
