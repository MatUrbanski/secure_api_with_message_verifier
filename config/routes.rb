Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resource :session, only: :create, path: 'login'
    resources :users, only: :index
  end
end