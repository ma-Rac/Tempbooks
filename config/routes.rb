Rails.application.routes.draw do

  get 'comments/new'

  post 'comments/create', as: :comments

  get 'friendships/create' => "friendships#create", as: :populate
  resources :friends
  resources :posts
  devise_for :users

  # resources :users do
  #   resource :profile
  # end
  #
  # "/users/:user_id/profile"
  # "/users/1/profile"
  #
  # def show
  #   @user = User.find params[:user_id]
  #   @profile = @user.profile
  # end

  # resources :users do
  #   resources :profiles
  # end


  namespace :user do
    get "/profile" => "/profile#show", as: :profile
    get "/profile/:id" => "/profile#show_friend", as: :show_friend
    get "/profile/new" => "/profile#new", as: :new_profile
    post "/profile" => "/profile#create"
    get "/profile/edit" => "/profile#edit", as: :edit_profile
    put "/profile" => "/profile#update"
    patch "/profile" => "/profile#update"
    delete "/profile" => "/profile#destroy"

    "/profile/:id"

    "/profile"
  end

  root 'home#index'
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
