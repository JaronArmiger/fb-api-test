Rails.application.routes.draw do
  root 'static_pages#home'
  get 'auth/facebook/callback', to: 'users#login'
end
