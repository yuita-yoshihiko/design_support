Rails.application.routes.draw do
  resources :design_tips
  root 'home#top'
  get 'for_beginner' => 'home#for_beginner'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
