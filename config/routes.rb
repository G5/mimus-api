Rails.application.routes.draw do
  resources :mimi 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'mimi#new'

  get 'mimi/*globbed_path', to: 'mimi#show'
  post 'mimi/*globbed_path', to: 'mimi#show'
end
