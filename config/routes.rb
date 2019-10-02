Rails.application.routes.draw do
  resources :attachments
  resources :user_messages
  resources :messages
  resources :type_messages
  resources :jobs
  resources :user_admins
  root 'homes#index'
  post 'auth/register', to: 'access#register'
  post 'auth/login', to: 'access#login'

  get 'auth/index', to: 'access#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
