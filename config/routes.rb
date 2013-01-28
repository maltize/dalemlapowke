Dalemlapowke::Application.routes.draw do

  # resources :bribes, :only => [:index, :new, :show, :create]

  match 'historie' => 'bribes#index', :as => 'bribes', :via => :get
  match 'historie/nowa' => 'bribes#new', :as => 'new_bribe', :via => :get
  match 'historie' => 'bribes#create', :as => 'bribes', :via => :post
  match 'historie/:id' => 'bribes#show', :as => 'bribe', :via => :get

  match 'komentarze' => 'comments#create', :as => 'comments', :via => :post

  match 'szukaj' => 'search#find', :as => 'search', :via => :get

  match 'o-serwisie' => 'static#about', :as => 'about', :via => :get
  match 'warunki-uzytkowania' => 'static#terms', :as => 'terms', :via => :get
  match 'kontakt' => 'static#contact', :as => 'contact', :via => :get

  root :to => 'home#index'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end



  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
