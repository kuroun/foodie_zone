Rails.application.routes.draw do

  resources :meals, except: [:new]
  resources :users
  resources :restaurants do
    get 'new_meal', to: 'restaurants#new_meal', as: 'new_meal', on: :member
  end
  resources :zones, except: [:show]

  get 'day/:day_id/adding_zones', to: 'zone_days#adding_zones', as: 'adding_zones'
  post 'day/:day_id/added_zones', to: 'zone_days#added_zones', as: 'added_zones'
  delete 'zone_days/:zone_day_id', to: 'zone_days#destroy', as: 'remove_zone_day'
  get 'day/:day_id/assign_restaurants_to_zones', to: 'zone_days#assign_restaurants_to_zones', as: 'assign_restaurants_to_zones'
  post 'restaurant_zone_days/update_create', to: 'restaurant_zone_days#update_create', as: 'update_create_restaurant_zone_day'
  get 'delivery_schedule/index'

  root 'delivery_schedule#index'

  mount Apidoco::Engine, at: "/docs"
  api versions: 1, module: 'api/v1' do
    get 'all_meals/:day/zones/:zone_id', to: 'meals#get_all_meals', as: 'all_meals'
    delete 'meals/:meal_id/', to: 'meals#destroy', as: 'delete_meal'
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
