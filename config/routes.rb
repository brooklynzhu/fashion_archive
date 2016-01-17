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
      resources :deliveries do
          get 'check_out_pieces' => "deliveries#check_out"
          put 'complete_check_out' => "deliveries#complete_check_out"
        end
      resources :pickups do
        get 'check_in_pieces' => "pickups#check_in"
        put 'complete_check_in' => "pickups#complete_check_in"
        resources :pieces
      end
    end
  end
end