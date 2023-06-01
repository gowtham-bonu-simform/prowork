Rails.application.routes.draw do
  root "samples#index"
  #devise_for :users, controllers: {  }
  devise_for :users, :controllers => { registrations: 'users/registrations', confirmations: 'confirmations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end