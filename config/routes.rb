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
        get 'profile' => "clients#profile"
      resources :pieces
    end
  end

  resources :pickups do
    resources :pieces, only: [:new, :create]
    get 'check_in_pieces' => "pickups#checkin"
    put 'complete_check_in' => "pickups#complete_check_in"
    
  end

  resources :deliveries



end
