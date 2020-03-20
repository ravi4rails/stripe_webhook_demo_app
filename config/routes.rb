Rails.application.routes.draw do
  mount StripeEvent::Engine, at: '/stripe/webhook'
  resources :users
  resources :payments, only: [:create]

  get '/checkout' => "users#checkout"
  root "users#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
