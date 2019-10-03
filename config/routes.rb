Rails.application.routes.draw do
  resource :client_settings, only: %i[show edit update]
  resources :distributors
  resources :clients
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
