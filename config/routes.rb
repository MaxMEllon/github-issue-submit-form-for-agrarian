Rails.application.routes.draw do
  root to: 'dashboard#new'
  post '/dashboard', to: 'dashboard#create'
end
