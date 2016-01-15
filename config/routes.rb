Rails.application.routes.draw do
  

  devise_for :collection_managers
  devise_for :admin_users
  root 'dashboard#index'

  resources :admin_users do
    resources :collection_managers do
    end
  end

  resources :collection_managers, shallow: true do
    resources :clients do
      resources :pieces
    end
  end


end
