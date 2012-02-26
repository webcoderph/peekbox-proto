Peekbox::Application.routes.draw do

  get "pictures/index"

  get "pictures/show"

  get "pictures/update"

  get "pictures/destroy"

  get "category/show"

	devise_for :users, :controllers => {:session => "user/session"} 

	get "profile" => "profile/profile#index"


	#all about users
	namespace :profile do
		resources :users, :only => [:index]
		resources :albums do
			resources :pictures
		end
		resources :events
		resources :videos
	end


	resources :videos, :only => [:show, :index] do 
		resources :comments, :only => [:new, :show, :index]
	end 

	resources :events, :only => [:show, :index]

	resources :albums, :only => [:show, :index] do
		resources :images, :only => [:show, :index]
	end

	resources :category, :only => [:show]

	get "help" => "static#help"

	get "company" => "static#company"


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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
