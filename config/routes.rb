Rails.application.routes.draw do
  root :to =>"public/homes#top"
  get "about"=>"public/homes#about" 

  resources :items, only: [:index,:show]

  devise_for :customers,skip: [:password], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  get 'customers/my_page'
  get 'customers/information/edit'
  patch 'customers/information'
  get 'customers/unsubscribe'
  patch 'customers/withdraw'

  resources :cart_items, only: [:index,:update,:destroy,:create]
  delete 'cart_items/destroy_all'

  resources :orders, only: [:new,:create,:index,:show]
  post 'orders/confirm'
  get 'orders/complete'

  resources :deliveries, only: [:index,:edit,:create,:destroy,:update]



  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }


  get "admin"=>'admin/homes#top'
  
  namespace :admin do
    resources :items, except: [:destroy]
  end

  namespace :admin do
    resources :genres, only: [:index,:create,:edit,:update]
  end

  namespace :admin do
    resources :customers, only: [:index,:show,:edit,:update]
  end
  namespace :admin do
    resources :orders, only: [:show,:update]
  end
  
  namespace :admin do
    resources :orders_details, only: [:update]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
