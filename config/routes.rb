Rails.application.routes.draw do
  devise_for :users
  root to: "bikes#index"
  get "/my-bikes", to: "bikes#mybikes"
  get "/my-bookings", to: "bookings#mybookings"

  resources :bikes, except: [:index] do
    resources :bookings, only: %i[create new]
  end
  resources :bookings, only: %i[destroy]
end
