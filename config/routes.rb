Gallery::Application.routes.draw do
  match 'auth/:provider/callback' => 'users#createfb'
  match 'auth/failure', to: redirect('/')
  match 'signout' => 'sessions#destroy', :as => 'signout'
  get "/log_in" => "sessions#new", :as => "log_in"
  get "/sign_up" => "users#new", :as => "sign_up"
  get "/log_out" => "sessions#destroy", :as => "log_out"
  match "/contact" => "emailer#index"
  match "/upload" => "pictures#new"
  match "/about" => "static#about"
  match '/messages' => 'message#new'
  root :to => "home#index"
  resources :sessions
  resources :users
  resources :pictures
  resources :home
  resources :static
  resources :message
  resources :emailer

end
