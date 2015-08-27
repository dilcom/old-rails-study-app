Rails.application.routes.draw do
  get 'paypal_payments/checkout'

  get 'paypal_payments/success'

  get 'paypal_payments/fail'

  resources :card_payments, only: [:index, :new, :create]
  post 'card_payment', to: 'card_payments/new'

  scope :module => 'admin_area' do
    resources :orders
    resources :products do
      resources :pictures
    end
  end
  resources :feedbacks

  post 'add_product', to: 'carts#add_product'
  get 'view_product', to: 'store#view_product'
  get 'about_us', to: 'store#about_us'
  get 'inc_cart_item', to: 'carts#inc'
  get 'dec_cart_item', to: 'carts#dec'
  post 'remove_cart_item', to: 'carts#remove_cart_item'

  devise_for :admins

  get 'active_order', to: 'store#active_order'
  get 'cart', to: 'carts#show'
  delete 'cart', to: 'carts#destroy'
  get 'store', to: 'store#index'
  get 'cart_items/:id/update_count', to: 'cart_items#update_count'
  root to: 'store#home'
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
