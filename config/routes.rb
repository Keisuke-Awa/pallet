Rails.application.routes.draw do
  root 'sites#index'

  resources :sites, only: [:show]

end
