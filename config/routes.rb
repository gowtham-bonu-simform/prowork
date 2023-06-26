Rails.application.routes.draw do
  # namespace :admin do
  #   get 'posts/index'
  # end
  root "switch#land"
  #devise_for :users, controllers: {  }
  devise_for :users, :controllers => { registrations: 'users/registrations', confirmations: 'confirmations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  scope "switch/" do
    get 'become_freelancer', to: 'switch#become_freelancer', as: 'become_freelancer'
    get 'switch as client', to: 'switch#switch_as_client', as: 'client'
    get 'switch as freelancer', to: 'switch#switch_as_freelancer', as: 'freelancer'
  end

  namespace :client do
    resources :posts
  end

  resource :profile, module: 'freelancer', controller: :profile do
    collection do
      get 'experiences'
      get 'education'
      get 'languages'
      get 'certifications'
    end
  end
  resolve('Profile') { [:profile] }
end