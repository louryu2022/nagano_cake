Rails.application.routes.draw do

  devise_for :customers,skip: [:password], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  get "search" => "searches#search"
  
scope module: :public do
  root :to =>"homes#top"
  get "about"=>"homes#about"

  resources :items, only: [:index,:show]

  get 'customers/my_page'=>"customers#show"
  get 'customers/information/edit' => 'customers#edit'
  patch 'customers/information' => 'customers#update'
  get 'customers/unsubscribe' => 'customers#unsubscribe'
  patch 'customers/withdraw' => 'customers#withdraw'

  delete 'cart_items/destroy_all'
  resources :cart_items, only: [:index,:update,:destroy,:create]

  post 'orders/confirm' => 'orders#confirm'
  get 'orders/complete' => 'orders#complete'
  resources :orders, only: [:new,:create,:index,:show]


  resources :deliveries, only: [:index,:edit,:create,:destroy,:update]
end


  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  get "admin"=>'admin/homes#top'

  namespace :admin do
    resources :items, except: [:destroy]

    resources :genres, only: [:index,:show,:create,:edit,:update]

    resources :customers, only: [:index,:show,:edit,:update]

    resources :orders, only: [:show,:update]

    resources :order_details, only: [:update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
