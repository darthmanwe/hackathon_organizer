Rails.application.routes.draw do
  resources :projects do
    member do
      get "add_subscriber"
      delete "remove_subscriber"
      delete "admin_force_remove_subscriber"
      get "add_thumbs_up"
      delete "remove_thumbs_up"
    end

    resources :comments, only: [:create]
  end

  resources :notifications, only: [:index] do
    collection do
      get :counter
      delete :destroy_all
    end
  end

  resources :users, only: [:index] do
    member do
      get "give_user_admin"
      delete "revoke_user_admin"
    end
  end

  get "auth/login" => "auth#login"
  get "auth/logout" => "auth#logout"
  match "auth/:provider/callback" => "auth#callback", via: [:get, :post]
  get "auth/failure" => "auth#failure"
  get "ping" => "application#ping"
  root to: "projects#index"
end
