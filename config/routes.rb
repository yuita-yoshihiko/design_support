Rails.application.routes.draw do

  root 'home#top'
  get 'for_beginner' => 'home#for_beginner'
  get 'growing', to: 'home#growing'
  get 'privacy_policy', to: 'home#privacy_policy'
  get 'terms_of_use', to: 'home#terms_of_use'

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

  namespace :admin do
    root to: 'dashboards#index'
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    delete 'logout', to: 'user_sessions#destroy'
    resources :design_tips
    resources :users, only: %i[index edit update show destroy]
  end
end
