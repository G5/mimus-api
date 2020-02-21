Rails.application.routes.draw do
  resources :mimi 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'mimi#new'
end
