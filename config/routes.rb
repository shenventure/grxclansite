Grxclan::Application.routes.draw do
  get "registrations/account_update_params"
  devise_for :users, :controllers => { registrations: 'registrations' }

  get "videos/index"
  get "videos/show"

  root 'static_pages#home'
  get "static_pages/about"

  resources :topics do
    member do
      post 'upvote'
    end
  end

  resources :users

  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/roster', to: 'static_pages#roster',   via: 'get'
  match '/video', to: 'static_pages#video',     via: 'get'

  match '/users/:id(.:format)', to: 'users#show',   via: 'get'
  match '/users/:id', to: 'users#create',   via: 'post'


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
