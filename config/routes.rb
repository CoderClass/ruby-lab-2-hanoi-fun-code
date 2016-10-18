Rails.application.routes.draw do
  root 'welcome#index'
	resources :sessions, only: [:new, :create]
  delete '/sessions/destroy'
  resources :users
end
