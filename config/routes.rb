Rails.application.routes.draw do

  get 'news/index'

  get 'news/show'

  get 'creatives/index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root  'static_pages#main'
  match '/main',  to: 'static_pages#main',            via: 'get'
  match '/request',  to: 'bids#new',            via: 'get'
  match '/bids',  to: 'bids#create',            via: 'post'
  match '/all_news',  to: 'news#index',            via: 'get'
  match '/parents',  to: 'static_pages#parents',            via: 'get'
  
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'get'

  match '/semester_info', to: 'students#semester_info',     via: 'post'
  match '/semester_penalties', to: 'students#semester_penalties',     via: 'post'

  resources :sessions, only: [:new, :create, :destroy]
  resources :universities ,only:[ :index ,:show]
  resources :news ,only:[ :show ]
  resources :students ,only:[ :show ]


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
