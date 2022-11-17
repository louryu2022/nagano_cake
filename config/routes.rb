Rails.application.routes.draw do
  root :to =>"public/homes#top"
  get "home/about"=>"homes#about" #rails routesしたらURLが違ってて飛ばしてます。

  resources :items, only: [:index,:show]

  #registrationsとsessionsは行っていません。

  resources :customers, only: [:show,:edit,:update]
  get 'customers/unsubscribe'
  patch 'customers/withdraw'

  resources :cart_items, only: [:index,:update,:destroy,:create]
  delete 'cart_items/destroy_all'

  resources :orders, only: [:new,:create,:index,:show]
  post 'orders/confirm'
  get 'orders/complete'


  resources :deliveries, only: [:index,:edit,:create,:destroy,:update]


  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
  end
  namespace :admin do
    get 'homes/top'
  end


  # namespace :public do
  #   get 'deliveries/index'
  #   get 'deliveries/edit'
  # end
  # namespace :public do
  #   get 'orders/new'
  #   get 'orders/complete'
  #   get 'orders/index'
  #   get 'orders/show'
  # end
  # namespace :public do
  #   get 'cart_items/index'
  # end
  # # namespace :public do
  #   # get 'customers/show'
  #   # get 'customers/edit'

  # # end
  # namespace :public do
  #   get 'items/index'
  #   get 'items/show'
  # end
  # namespace :public do
  #   get 'homes/about'
  # end

  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
