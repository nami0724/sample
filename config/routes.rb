Rails.application.routes.draw do
  devise_for :users
  resources :areas
  
  get "search" => "searches#search"
  # devise_for :Users, :controllers => {
  #   :registrations => 'users/registrations',
  #   :sessions => 'users/sessions'   
  # } 

  # devise_scope :user do
  #   get "sign_in", :to => "users/sessions#new"
  #   get "sign_out", :to => "users/sessions#destroy" 
  # end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :rooms do
    collection do
      get :posts
    end
  end

  resources :reservations do
  end

  resources :users do
    collection do
      get :account
      get :profile
    end
  end

  root 'homes#index'
  get 'mypage', to: 'homes#mypage'
end

