Rails.application.routes.draw do
  get 'post/new'

  get 'post/create'

  get 'post/edit'

  get 'post/update'

  get 'post/destroy'

  root 'sites#index'

  resources :sites, only: [:show] do
    resources :categories, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :posts, only: [:new, :create, :edit, :update, :destroy]
  end

end
