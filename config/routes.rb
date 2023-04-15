Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  root 'home#top'
  get 'for_beginner' => 'home#for_beginner'
  get 'growing', to: 'home#growing'
  get 'privacy_policy', to: 'home#privacy_policy'
  get 'terms_of_use', to: 'home#terms_of_use'
  get 'operation', to: 'home#operation'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  post "oauth/callback", to: "oauths#callback"
  get "oauth/callback", to: "oauths#callback"
  get "oauth/:provider", to: "oauths#oauth", as: :auth_at_provider

  get 'trend', to: 'trends#index'

  resources :password_resets, only: %i[new create edit update]

  resources :users, only: %i[new create destroy]
  resources :design_tips, only: %i[index] do
    collection do
      get 'search'
      get 'likes'
    end
  end

  resources :likes, only: %i[create destroy]
  resources :lists, only: %i[new create edit update destroy]
  resources :list_design_tips, only: %i[index create destroy]

  resources :questions, only: %i[index] do
    collection do
      get 'answer'
    end
  end

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

  get "/404", to: "error#not_found", as: "not_found"
  get "/500", to: "error#internal_server_error", as: "internal_server_error"
end
