Rails.application.routes.draw do
  
 
  devise_for :users
  resources :orders, only: [:new, :create]
  resources :items
  resource :cart, only: [:show] do
    post 'add_item/:item_id', to: 'carts#add_item', as: 'add_item'
    delete 'remove_item/:id', to: 'carts#remove_item', as: 'remove_item'
   
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :galeries, only: [:index]

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "items#index"
end
