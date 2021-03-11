Rails.application.routes.draw do

  root to: "categories#index"

  resources :categories do
    resources :products do
      get :show_params, to: 'products#show_params'
      get :new_param, to: 'products#new_param'
      post :create_param, to: 'products#create_param'
    end
    resources :parameters do
      resources :string_attributes, except: [:index]
      resources :int_attributes, except: [:index]
      resources :hash_attributes, except: [:index] do
        resources :hash_elements, except: [:index]
      end
      resources :decimal_attributes, except: [:index]
    end
  end

end
