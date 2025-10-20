Rails.application.routes.draw do


  # Devise routes including OmniAuth callbacks
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }


  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Optional: custom paths for sign in/out
  get '/sign_in', to: redirect('/users/auth/steam'), as: :sign_in
  get '/sign_out', to: 'devise/sessions#destroy', as: :sign_out

  # Cheat reports
  resources :cheat_reports, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    collection do
      get :confirmed_players
      get :pending_players
      get :suspected_players
      get :tailwindtest
      get :turbo_test
      get :country
    end
  end

  # Blog posts
  resources :blog_posts do
    resource :cover_image, only: [:destroy], module: :blog_posts
  end

  # Root path
  root "cheat_reports#index"
end
