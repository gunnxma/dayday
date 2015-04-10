require 'sidekiq/web'

Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'index#index'

  #get 'index/phones'

  get 'index/hits', :as => :hits

  get 'users/login'

  resources :users do
    member do
      get :followings
      get :followers
      get :fancies
      get :owns
      get :things
      get :lists
      get :reviews
      get :feelings
    end
    resource :followers
  end

  resources :identities, only: [:new]

  resources :sessions, only: [:new, :create, :destroy]

  get "/auth/:provider/callback", to: "sessions#create"
  post "/auth/:provider/callback", to: "sessions#create"
  get "/signout", to: "sessions#destroy", :as => :signout
  get "/auth/failure", to: "sessions#failure"

  post 'things/crawler'
  post 'things/to_list'
  resources :things, except: [:index], :shallow => true do
    member do
      get :feelings
    end
    resources :reviews
    resources :buys
  end
  resources :photos, only: [:create, :destroy, :index]

  resources :feelings
  resources :votes
  resources :likes
  resources :owns

  post 'kindeditor_upyun/upload'

  resources :lists, :shallow => true do
    resources :feelings
    resources :lfanciers
  end

  get "settings", to: "settings#profile"
  get 'settings/profile'
  patch 'settings/profile', to: "settings#save_profile"  
  get 'settings/account'
  patch 'settings/account', to: "settings#save_account"
  get 'settings/drafts'
  resources :settings

  get 'search/things'

  resources :notifications

  mount Sidekiq::Web, at: '/sidekiq'

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

  match '*path', via: :all, to: 'index#error_404'
end
