Rails.application.routes.draw do

  root 'home#top'
  get 'for_beginner' => 'home#for_beginner'
  get 'growing', to: 'home#growing'
  get 'privacy_policy', to: 'home#privacy_policy'
  get 'terms_of_use', to: 'home#terms_of_use'
  get 'trend', to: 'home#trend'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  post "oauth/callback", to: "oauths#callback"
  get "oauth/callback", to: "oauths#callback"
  get "oauth/:provider", to: "oauths#oauth", as: :auth_at_provider

  resources :users, only: %i[new create destroy]
  resources :design_tips, only: %i[index show] do
    collection do
      get 'search'
      get 'likes'
    end
  end

  resources :likes, only: %i[create destroy]

  resources :lists
  resources :list_design_tips

  namespace :admin do
    root to: 'dashboards#index'
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    delete 'logout', to: 'user_sessions#destroy'
    resources :design_tips do
      collection do
        get 'search'
      end
    end
    resources :users, only: %i[index edit update show destroy]
  end

  get "/404", to: "errors#not_found", as: "not_found"
  get "/500", to: "errors#internal_server_error", as: "internal_server_error"
end
