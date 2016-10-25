Rails.application.routes.draw do

  # omniauth route
  get "/auth/:provider/callback" =>  "sessions#create"

  get "logout" => "sessions#destroy", as: "logout"

  root to: 'pages#index'

  resources :products do
    resources :reviews
  end

  resources :users, :categories, :orders, :addresses, :order_products

  get 'cart' => 'pages#cart', as: 'cart'

  get 'account' => 'users#show', as: 'account'

  get 'account/edit' => 'users#edit', as: 'account_edit'

  put 'account/update' => 'users#update', as: 'account_update'
end
