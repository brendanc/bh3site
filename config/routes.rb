Bh3site::Application.routes.draw do

# static / welcome routes
  root "static#welcome"
  get "/hash/:id", to: "static#welcome"

# about routes
  get "/about" => "about#index"
  get "about/history" 
  get "about/mismanagement" 
  
# cal route
  get "calendar" => "static#calendar", as: :calendar

#static route
  get "static/welcome/:id", to: "static#welcome"
  get "static/events"
  
#more route
  get "more" => "more#index"
  get "more/email" => "more#index"
  get "more/away" => "more#away"
  get "more/trail" => "more#trail"
  get "more/habadashery" => "more#habadashery" 
  
#posts route
  get "posts/:page_number" => "posts#index", as: :hashtrash
  get "posts/index/:page_number" => "posts#index"
  get "posts" => "posts#index"

#special_events route
  get "events" => "special_events#index"
  get "events/:url_code" => "special_events#show"

resources :special_events, only: [] do
  resources :event_registrations, only: [:new, :create, :show]
end

#handle paypal webhooks, yay!
  post "paypal" => "pay#catch"
  get "pay" => "pay#index"
  get "paypal/success/:url_code" => "pay#success"


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
