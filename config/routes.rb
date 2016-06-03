# Rails.application.routes.draw do


#   resources :listings

#   resources :passwords, controller: "clearance/passwords", only: [:create, :new]
#   resource :session, controller: "clearance/sessions", only: [:create]

#   resources :users, controller: "clearance/users", only: [:create] do
#     resource :password,
#       controller: "clearance/passwords",
#       only: [:create, :edit, :update]
#   end

#   get "/sign_in" => "clearance/sessions#new", as: "sign_in"
#   delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
#   get "/sign_up" => "clearance/users#new", as: "sign_up"
#   get 'welcome/index'
#   resources :users, only: [:show, :edit, :update, :destroy]

#   root 'welcome#index'
#   get "/auth/:provider/callback" => "sessions#create_from_omniauth"


Rails.application.routes.draw do

  # Landing Page
  root 'sessions#new'

  # Post SIGN-IN redirect to Homepage
  get 'static/home' => 'static#home'

  # USERS
  resources :users, only: [:show, :edit, :update, :destroy]

  # PROFILE
  get '/profile', to: "users#profile", as: "my_profile"

  # FACEBOOK SIGN-IN
  get "/auth/:provider/callback" => "sessions#create_from_omniauth", as: "callback"

  # SESSIONS
  # get 'sessions/show'

  # LISTINGS
  resources :listings do
    resources :reservations
  end

  resources :reservations, only: [] do
      resources :payments, only: [:new, :create]
  end

  # CATEGORIES
  get 'tags/:tag', to: 'listings#index', as: :tag

 get 'search', to: 'search#search'
 post 'search', to: 'search#search'

 get 'listings/template'

  # PAYMENTS
  # get 'payments/new/:id', to: "payments#new"

  # Makes SIGN-UP the landing page
  # root 'clearance/users#new'

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
