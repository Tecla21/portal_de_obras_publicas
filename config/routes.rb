Rails.application.routes.draw do
  resources :empreiteiros
  resources :municipios
  resources :provincias
  resources :paises
  get 'dashboard/home'
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    
    # User resources
    devise_for :users
    ## User controller
    get 'users/index' => 'users#index', as: 'users'
    get 'users/new' => 'users#new', as: 'new_user'
    get 'users/:id/edit' => 'users#edit', as: 'edit_user'
    get 'users/:id' => 'users#show', as: 'user'
    post 'users/create', to: 'users#create'
    patch 'users/:id', to: 'users#update'

    get 'dashboard/index' => 'dashboard#index', as: 'site_index'


    # Root
    root to: 'dashboard#index'
  end
end
