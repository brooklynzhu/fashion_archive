Rails.application.routes.draw do
  
  devise_for :collection_managers
  devise_for :admin_users

  root 'dashboard#index'
    get 'completed' => "dashboard#completed"

  resources :admin_users do
    resources :collection_managers do
    end
  end

  resources :collection_managers, shallow: true do
    resources :clients do
        get 'profile' => "clients#profile"
      resources :pieces do
        get 'garments', on: :collection
        get 'bags', on: :collection
        get 'shoes', on: :collection
        get 'accessories', on: :collection
      end
      resources :deliveries do
        collection do
            put :completed
        end
          get 'check_out_pieces' => "deliveries#check_out"
          put 'complete_check_out' => "deliveries#complete_check_out"
          put 'remove_piece' => 'deliveries#remove'
        end
      resources :pickups do
        collection do
            put :completed
        end
        get 'check_in_pieces' => "pickups#check_in"
        put 'complete_check_in' => "pickups#complete_check_in"
        put 'remove_piece' => 'pickups#remove'
        resources :pieces
      end
    end
  end
end