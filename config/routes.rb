Rails.application.routes.draw do
  root 'sites#index'

  resources :sites, only: [:show] do
    resources :categories, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :posts, only: [:new, :create, :edit, :update, :destroy]
  end

end
