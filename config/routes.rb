Rails.application.routes.draw do
  
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'contactus' => 'pages#contactus'  

  ActiveAdmin.routes(self)
  devise_for :users
    as :user do
      get "login" => 'devise/sessions#new'
      delete "signout" => 'devise/sessions#destroy'
      get "signup" => 'devise/registrations#new'
    end
    
  get 'feed', to: 'feed#show'

  resources :users, param: :username do
    member do
      post 'follow', to: 'follows#create'
      delete 'unfollow', to: 'follows#destroy'
    end
  end

  resources :tweets do
    member do
      post 'vote', to: 'votes#create'
      delete 'unvote', to: 'votes#destroy'
    end
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end