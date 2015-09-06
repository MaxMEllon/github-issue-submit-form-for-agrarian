Rails.application.routes.draw do
  root to: 'issues#new'
  resources :issues, only: [:new, :create]
end
