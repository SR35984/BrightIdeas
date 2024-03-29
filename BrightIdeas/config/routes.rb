Rails.application.routes.draw do

  root 'users#index', as: 'user_index'
  post 'users/create' => 'users#create', as: 'create_user'
  post 'users/login' => 'users#login', as: 'login_user'
  get 'users(/:id)' => 'users#show', as: 'show_user'
  delete 'users/logout' => 'users#logout', as: 'logout_user'

  get 'bright_ideas' => 'ideas#index', as: 'idea_index'
  get 'bright_ideas(/:id)' => 'ideas#show', as: 'show_idea'
  post 'ideas/create' => 'ideas#create', as: 'create_idea'

  post 'likes' => 'likes#create', as: 'create_like'
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
