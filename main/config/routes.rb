Rails.application.routes.draw do

# Custom Routes: 
# As the pages are created simply comment out the construction route
# and uncomment the route to the actual page

# Home Page
match '/', to:'static_pages#home', via:'get' 
  
# About Us Tab
match '/about', to:'static_pages#about', via:'get' 
# match '/about', to:'static_pages#under_construction', via:'get' 

# Our People --> Our Partners
match '/partners', to:'static_pages#partners', via:'get' 
# match '/partners', to:'static_pages#under_construction', via:'get' 

# Our People 
# match '/members', to:'members#show',  via:'get'
match '/members', to:'static_pages#under_construction', via:'get' 
  resources :members

  # Exec Board
  match '/exec_board', to:'members#exec_board',  via:'get'
  # match '/exec_board', to:'static_pages#under_construction', via:'get' 

  # International Project Team
  match '/intl_project_team', to:'members#intl_project_team',  via:'get'
  # match '/intl_project_team', to:'static_pages#under_construction', via:'get' 

  # Local Project Team
  match '/local_project_team', to:'members#local_project_team',  via:'get'
  # match '/local_project_team', to:'static_pages#under_construction', via:'get' 

  # Software Team
    match '/software_team', to:'members#software_team',  via:'get'
    # match '/software_team', to:'static_pages#under_construction', via:'get' 

  # Alum
  match '/alumni', to:'members#alum',  via:'get'
  # match '/alum', to:'static_pages#under_construction', via:'get' 

# Our Projects
match '/projects',  to:'projects#show',  via:'get'
# match '/projects', to:'static_pages#under_construction', via:'get' 

    # Local Projects (bithlo, rainwater catchment)
    match '/projects/local',  to:'projects#local',  via:'get'
    # match '/projects/local', to:'static_pages#under_construction', via:'get' 

        # Bithlo Aquaponics
        match '/projects/local/bithlo',  to:'projects#bithlo',  via:'get'
        # match '/projects/local/bithlo', to:'static_pages#under_construction', via:'get' 

        # PBP Rainwater
        match '/projects/local/pbp',  to:'projects#pbp',  via:'get'

    # International Projects (weather station, dr)
    match '/projects/international',  to:'projects#international',  via:'get'
    # match '/projects/international', to:'static_pages#under_construction', via:'get' 

        # Mare Brignol, Haiti
        match '/projects/international/haiti',  to:'projects#haiti',  via:'get'
        # match '/projects/international/haiti', to:'static_pages#under_construction', via:'get' 

        # Dominican Republic
        match '/projects/international/dr',  to:'projects#dr',  via:'get'
        #match '/projects/international/dr', to:'static_pages#under_construction', via:'get' 


    # Software Projects
    match '/projects/software',  to:'projects#software',  via:'get'
    # match '/projects/software', to:'static_pages#under_construction', via:'get' 

    # Other Projects
    match '/projects/other',  to:'projects#other',  via:'get'
    # match '/projects/other', to:'static_pages#under_construction', via:'get' 

# Events
match '/events',  to:'events#show',  via:'get'
# match '/events', to:'static_pages#under_construction', via:'get' 

  # Workshops
  match '/workshops',  to:'events#workshops',  via:'get'
  # match '/workshops', to:'static_pages#under_construction', via:'get' 

  # RECURRING WORKSHOPS THUS STATIC PAGES
  match '/workshops/webdevseries',  to:'events#webdevseries',  via:'get'
  match '/workshops/matlabseries',  to:'events#matlabseries',  via:'get'
  match '/workshops/circuitseries',  to:'events#circuitseries',  via:'get'
  match '/workshops/firstaid',  to:'events#firstaidseries',  via:'get'
  match '/workshops/engineeringtoolkit',  to:'events#engineeringtoolkitseries',  via:'get'
  match '/workshops/fabricationseries',  to:'events#fabricationseries',  via:'get'

  # Lectures
  match '/lectures',  to:'events#lectures',  via:'get'
  # match '/lectures', to:'static_pages#under_construction', via:'get'

      # RECURRING LECTURES THUS STATIC PAGES
    match '/lectures/scrapstogold',  to:'events#scrapstogold',  via:'get'
    match '/lectures/turbinepower',  to:'events#turbinepower',  via:'get'
    match '/lectures/solarpower',  to:'events#solarpower',  via:'get'

# Media (photos and videos)
# match '/media',  to:'medias#show',  via:'get' 
match '/media', to:'static_pages#under_construction', via:'get' 

  # Photos (categorized by event+date)
  # match '/media/photos',  to:'medias#photos',  via:'get'
  match '/media/photos', to:'static_pages#under_construction', via:'get' 

  # Videos (categorized by event+date)
  # match '/media/videos',  to:'medias#videos',  via:'get'
  match '/media/videos', to:'static_pages#under_construction', via:'get' 

# Contact 
# (have a drop down menu with options of who to send to general, localpm, software, etc)
#match '/contact',  to:'contacts#new',  via:'get'
match '/contact', to:'static_pages#under_construction', via:'get' 
  resources "contacts", only: [:new, :create]

# Other URLS and links

  # Applications
  match '/applications/membership',  to:'members#new',  via:'get'
  # match '/applications/membership', to:'static_pages#under_construction', via:'get'

  match '/applications/intl_project_team',  to:'members#new_international',  via:'get' 
  # match '/applications/intl_project_team', to:'static_pages#under_construction', via:'get' 

  # match '/applications/local_project_team',  to:'members#new_local',  via:'get' 
  match '/applications/local_project_team', to:'static_pages#under_construction', via:'get' 

  # match '/applications/software_team',  to:'members#new_software',  via:'get' 
  match '/applications/software_team', to:'static_pages#under_construction', via:'get' 

  # match '/applications/executive_board',  to:'members#new_exec_board',  via:'get' 
  match '/applications/executive_board', to:'static_pages#under_construction', via:'get' 

  # Forms
  # match '/forms/project_proposal',  to:'projects#new',  via:'get'
  match '/forms/project_proposal', to:'static_pages#under_construction', via:'get' 

  # match '/forms/event_proposal',  to:'events#new',  via:'get'
  match '/forms/event_proposal', to:'static_pages#under_construction', via:'get' 

  # match '/forms/order',  to:'X#new',  via:'get'
  match '/forms/order', to:'static_pages#under_construction', via:'get' 


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
