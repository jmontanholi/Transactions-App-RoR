Rails.application.routes.draw do
  root 'users#splash_page'
  devise_for :users
  get '/user' => "categories#index", :as => :user_root
  get '/home_page', to: 'users#home_page'
  get '/categories/new', to: 'categories#new'
  post '/categories/create', to: 'categories#create'
  get '/categories/:id', to: 'categories#show'
  get '/expenses/new', to: 'expenses#new'
  post '/expenses/create', to: 'expenses#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
