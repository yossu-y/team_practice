Rails.application.routes.draw do

  # 利用者のルーティング

  root to: "public/homes#top"

  scope module: :public do
    delete "cart_items/all_destroy" => "cart_items#all_destroy"
    resources :cart_items, only: [:index, :update, :create, :destroy]
  end

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    resources :orders, only: [:new]
  end


  # 管理者のルーティング

  namespace :admin do
    resources :genres, only: [:index, :edit, :create, :update]
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
