Rails.application.routes.draw do
  ## Administration
  devise_for :admins

  scope :module => 'admin_area' do
    resources :feedbacks, except: [:new]
    resources :orders, except: [:new]
    resources :products do
      resources :pictures
    end
  end
  # administration end

  ## Payments
  resources :paypal_payments, only: [:index, :show]
  get 'paypal_checkout', to: 'paypal_payments#new'
  get 'paypal_success', to: 'paypal_payments#success'
  get 'paypal_fail', to: 'paypal_payments#fail'

  resources :card_payments, only: [:index, :show, :create]
  get 'card_checkout', to: 'card_payments#new'
  # payments end

  ## Cart and cart items
  get 'cart', to: 'carts#show'
  post 'cart/add_product/:id', to: 'carts#add_product', as: 'add_product'
  get 'cart/inc_cart_item/:id', to: 'carts#inc', as: 'inc_cart_item'
  get 'cart/dec_cart_item/:id', to: 'carts#dec', as: 'dec_cart_item'
  delete '/cart/cart_item/:id', to: 'carts#remove_cart_item', as: 'remove_cart_item'
  delete 'cart', to: 'carts#destroy'
  # cart end

  ## Store
  get 'active_order', to: 'store#active_order'
  get 'store', to: 'store#index'
  get 'view_product/:id', to: 'store#view_product', as: 'view_product'
  get 'about_us', to: 'store#about_us'
  get 'home', to: 'store#home'
  # store end

  ## Contact us form
  get 'contact_us', to: 'store#contact_us'
  post 'contact_us', to: 'feedbacks#create'
  # contact us end

  root to: 'store#home'
end
