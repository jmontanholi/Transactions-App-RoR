Rails.application.routes.draw do
  root 'users#splash_page'
  devise_for :users

  get '/home_page', to: 'users#home_page'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
