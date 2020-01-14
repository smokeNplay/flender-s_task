Rails.application.routes.draw do
  root to: 'messages#index'

  resources :messages, only: %i[index create]
end
