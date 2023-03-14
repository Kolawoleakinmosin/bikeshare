Rails.application.routes.draw do
  devise_for :users
  root to: "bikes#index"
  resources :bikes, except: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
