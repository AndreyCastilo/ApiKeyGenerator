Rails.application.routes.draw do

  root 'keys#index'
  get 'request', to: 'request#index'
  get 'request/index'
  get 'find_duplicates', to: 'request#find_duplicates'

  resources :keys
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
