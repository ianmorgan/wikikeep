Wikikeep::Application.routes.draw do

  root :controller => 'home', :action => 'index'

  resources :accounts

  resources :users

  resources :tag_datas

  resources :content_items

  match 'login/:action(/:id)', :controller => 'login'

  match 'content/:action(/:id)', :controller => 'content'

  match 'tag/:action(/:id)', :controller => 'tag'

  match 'registration/:action(/:id)', :controller => 'registration'


  #named routes for common links
  match 'login' => 'login#show', :as => :login
  match 'logout' => 'login#logout', :as => :logout 
  match 'register' => 'registration#start', :as => :register
  match 'not_implemented', :controller => 'home', :action => 'not_implemented', :as => 'not_implemented'
  match 'about', :controller => 'home', :action => 'about', :as => 'about'


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

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
