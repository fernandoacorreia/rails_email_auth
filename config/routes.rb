Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  match "login_emails/authenticate", to: "login_emails#authenticate", via: [:get, :post]
  resource :login_email

  resources :numbers

  root "numbers#index"
end
