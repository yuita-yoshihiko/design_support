Rails.application.routes.draw do
  root 'home#top'
  get 'for_beginner' => 'home#for_beginner'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :design_tips do
    collection do
      get 'search'
    end
  end

  resources :users, only: %i[new create destroy]

  namespace :admin do
    root to: 'dashboards#index'
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    delete 'logout', to: 'user_sessions#destroy'
    resources :users, only: %i[index edit update show destroy]
    resources :design_tips, only: %i[new create index edit update show destroy]
  end
end
