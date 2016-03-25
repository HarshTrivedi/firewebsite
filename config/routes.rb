Rails.application.routes.draw do

  get   '/content_editor/:model_name/:id/:attribute'  => 'admin_contents#edit_content', as: :edit_content
  get   '/update_content_and_redirect/:model_name/:id/:attribute'  => 'admin_contents#update_content_and_redirect', as: :update_content_and_redirect

  get 'landings/index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  get   'fire/register'  => 'landings#new_register', as: :new_register #, constraints: {subdomain: /fire/ }
  post   'fire/register/submit'  => 'landings#register_submit', as: :register_submit #, constraints: {subdomain: /fire/ }

  get   'fire/:permalink'  => 'landings#fire'         , as: :default_fire_page #, constraints: {subdomain: /fire/ }
  get   'fire/:year/:permalink'  => 'landings#fire'         , as: :year_wise_fire_page #, constraints: {subdomain: /fire/ }

  get   'fire/download/:filename'  => 'landings#download'         , as: :fire_download #, constraints: {subdomain: /fire/ }

  get   'fire/'  => 'landings#fire'  #, constraints: {subdomain: /fire/ }

  get   '/'  => 'landings#index' #        , as: :fire_root , constraints: {subdomain: /fire/ }



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
