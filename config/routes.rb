Rails.application.routes.draw do
  resources :design_tips do
    collection do
      get 'search'
    end
  end
  root 'home#top'
  get 'for_beginner' => 'home#for_beginner'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
