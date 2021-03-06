Rails.application.routes.draw do
  resources :companies
  resources :checkups
  
  resources :reviews
get '/reporte' => 'welcome#reporte'

  resources :gas
  resources :receipts
  resources :expenses
  resources :vouchers
  resources :quotations do
    resources :places
    member do
      get :itinerary
      get :distance
      get :prices
      get :pdf
    end
  end

  resources :operators
  resources :buses
  resources :clients
  devise_for :users, skip: [:registrations]
  # resources :users
  resources :users_admin, :controller => 'users'
  resources :categories

  resources :records do
    collection do
      get :pizarron
      get :reportes
      get :cobranza
      get :historico
      get :registro
      get :operaciones
    end
    member do
      get :client
      get :itinerary
      get :trip
      get :bus
      get :price
      get :payments
      get :pdf
    end
    resources :payments
    resources :routes
    resources :services
  end

  resources :services, only: [:index, :update]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
