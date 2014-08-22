Rails.application.routes.draw do

# Home Page
root 'static_pages#index'

match '/contacts',  to: 'contacts#new', via: 'get'
resources "contacts", only: [:new, :create]

match '/donate',  to: 'donations#new', via: 'get'
resources :donations, only: [:new, :create]

#Alias the URLS to people "people/" instead of "teams/"
resources :teams, :path => "people" do
#  resource :application
  resources :projects
end

#Projects, events and users all have many blogs
# where blog is polymorphic
#resources :users, :has_many => :blogs
resources :projects, :has_many => :blogs
resources :events, :has_many => :blogs

#users/username/blog
resources :users do
  resources :projects
  resources :blogs
end

#Events
match '/calendar',  to: 'events#index', via: 'get'

#Add user sessions resource with only specific actions
resources :user_sessions, only: [:new, :create, :destroy]

get 'login' => 'user_sessions#new'
get 'logout' => 'user_sessions#destroy'
  
# About Us Tab
match '/about', to:'static_pages#show', via:'get'

# Contact us Page
match '/contact', to:'contacts#new', via:'get'
resources "contacts", only: [:new, :create]

match '/media', to:'static_pages#under_construction', via:'get' 

#These pages should be made dynamic eventually
get 'partners' => 'static_pages#partners'


#=======================================================================================#
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'static_pages/home'

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
