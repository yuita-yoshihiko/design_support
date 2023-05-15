Rails.application.routes.draw do
  get 'maps/index'
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  root 'home#top'
  get 'privacy_policy', to: 'home#privacy_policy'
  get 'terms_of_use', to: 'home#terms_of_use'
  get 'trend', to: 'trends#index'
  get 'image', to: 'images#index'
  get 'quiz', to: 'quizees#index'
  get 'content', to: 'maps#content'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  post "oauth/callback", to: "oauths#callback"
  get "oauth/callback", to: "oauths#callback"
  get "oauth/:provider", to: "oauths#oauth", as: :auth_at_provider

  resources :password_resets, only: %i[new create edit update]

  resources :users, only: %i[new create destroy]
  resources :design_tips, only: :index do
    resources :reviews, only: %i[index create]
    collection do
      get 'search'
      get 'likes'
    end
  end

  resources :likes, only: %i[create destroy]
  resources :lists, only: %i[new create edit update destroy]
  resources :list_design_tips, only: %i[index create destroy]
  resources :images do
    collection do
      get 'search'
    end
  end

  resources :answers, only: :index
  resources :notifications, only: :index
  resources :maps, only: :index
  resources :quizees, only: :index do
    collection do
      get 'commentary'
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
    resources :quizees
    resources :choices
    resources :maps
    resources :map_details
  end

  get "/404", to: "error#not_found", as: "not_found"
  get "/500", to: "error#internal_server_error", as: "internal_server_error"
end
