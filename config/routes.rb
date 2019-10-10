Rails.application.routes.draw do
  root to: 'power_generators#index'
  get '/search' => 'power_generators#search'
  resources :home, only: %i[index]
  resources :power_generators
end
