Rails.application.routes.draw do
  resources :locations

  resources :activities

  resources :skills

  resources :jobs 
#   do
#   	resources :hires
#   end

  get 'user_registrations/create'

  devise_for :users, :controllers => { :registrations => 'user_registrations' }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  get 'welcome/index'
	
	devise_scope :user do
		resources :users
		match 'worker/sign_up' => 'user_registrations#new', :user => { :user_type => 'worker' }, via: [:get]
		match 'customer/sign_up' => 'user_registrations#new', :user => { :user_type => 'customer' }, via: [:get]
  end
  
  get "jobs/:job_id/hire"  => "jobs#hire", :as => "hire"
  get "users/:user_id/job" => "users#jobs", :as => "user_jobs"
  get "hire/:id/accept" => "jobs#accept", :as => "accept"
  get "accepted_jobs" => "jobs#accepted_jobs", :as => "accepted_jobs"
  
  get "hire/accept" => "jobs#nill", :as => "nill"
  
  get "jobs/:job_id/add_feedback" => "jobs#add_feedback", :as => "add_feedback"
  get "worker/:user_id/job" => "jobs#hired_jobs", :as => "hired_jobs"
  delete "hire/:hire_id" => "users#hire_delete", :as => "hire_delete"
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
	root 'welcome#index'

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
