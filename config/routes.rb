Rails.application.routes.draw do
  devise_for :users
  root to: "bikes#index"
  resources :bikes do
    resources :bookings, only: %i[create new]
  end
  resources :bookings, only: %i[destroy]
end
